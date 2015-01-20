/*
 * usb_serial.cpp
 *
 *  Created on: 05 ����. 2013 �.
 *      Author: G.Kruglov
 */

#include "usb_serial.h"
#include "kl_lib_L15x.h"
#include "cmd_uart.h"

#define CDC_SET_LINE_CODING             0x20
#define CDC_GET_LINE_CODING             0x21
#define CDC_SET_CONTROL_LINE_STATE      0x22

// ==== Line Coding structure ====
struct Linecoding_t {
  uint8_t dwDTERate[4];
  uint8_t bCharFormat;
  uint8_t bParityType;
  uint8_t bDataBits;
} __attribute__((__packed__));

// Line Control bit definitions
#define LC_STOP_1                       0
#define LC_STOP_1P5                     1
#define LC_STOP_2                       2
#define LC_PARITY_NONE                  0
#define LC_PARITY_ODD                   1
#define LC_PARITY_EVEN                  2
#define LC_PARITY_MARK                  3
#define LC_PARITY_SPACE                 4

// ==== Variables ====
UsbSerial_t UsbSerial;

static Linecoding_t LineCoding = {
  {0x00, 0x96, 0x00, 0x00},             // 38400
  LC_STOP_1, LC_PARITY_NONE, 8
};

# if 1 // =============== Thread ==================
static WORKING_AREA(waUsbSerialThread, 128);
__attribute__ ((__noreturn__))
static void UsbSerialThread(void *arg) {
    chRegSetThreadName("Vcp");
    while(1) {
        chSysLock();
        chSchGoSleepS(THD_STATE_SUSPENDED);
        chSysUnlock();
        UsbSerial.IOutTask();
    }
}

void UsbSerial_t::IOutTask() {
    uint8_t Byte = 0;
    do {
        GetByte(&Byte);
        if(Byte == '\b') PCmdWrite->Backspace();
        else if((Byte == '\r') or (Byte == '\n')) CompleteCmd();
        else PCmdWrite->PutChar(Byte);
    } while(--BytesToRead != 0);
}

void UsbSerial_t::CompleteCmd() {
    if(PCmdWrite->IsEmpty()) return;
    chSysLock();
    PCmdWrite->Finalize();
    PCmdRead = PCmdWrite;
    PCmdWrite = (PCmdWrite == &ICmd[0])? &ICmd[1] : &ICmd[0];
    PCmdWrite->Cnt = 0;
    chSysUnlock();
    ParseCmd(PCmdRead);
}

void UsbSerial_t::CmdRpl(uint8_t ErrCode, uint32_t Length, ...) {
    uint32_t Buf[Length];
    if(Length != 0) {
        va_list Arg;
        va_start(Arg, Length);
        for (uint32_t i=0; i<Length; i++) Buf[i] = (uint32_t)va_arg(Arg, int);
        va_end(Arg);
    }
    if(ErrCode == 0) Printf("#Ack %X %A" END_OF_COMMAND, ErrCode, Buf, Length, ' ');
    else Printf("#Err %X" END_OF_COMMAND, ErrCode);
}

void UsbSerial_t::ParseCmd(Cmd_t *PCmd) {
//    Uart.Printf("\r\n%S", PCmd->IString);
    if(PCmd->NameIs(USB_SERIAL_PING)) CmdRpl(OK);
    else if(PCmd->NameIs(USB_SERIAL_CMD)) {
        uint32_t CmdID = 0;
        if(PCmd->TryConvertTokenToNumber(&CmdID) == OK) {
            Uart.Printf("\r\nCmdID: %u", CmdID);
            // Here we have cmd ID
            // cmd event eith ID and data and others and etc.

            CmdRpl(OK);
        } else CmdRpl(CMD_ERROR);
    }
    else if(*PCmd->Name == '#') CmdRpl(CMD_UNKNOWN);  // reply only #-started stuff
}

#endif

#if 1 // ======================== USB events ===================================
static void OnUsbReady() {
    Uart.Printf("\r\nReady");
    Usb.PEpBulkOut->StartOutTransaction();
}

static void SetLineCoding() {
//    Uart.Printf("SetLineCoding\r");
}
static void SetCtrlLineState() {
//    uint16_t w = Usb.SetupReq.wValue;
//    if(w & 0x0001) Uart.Printf("DTR 1\r");
//    else Uart.Printf("DTR 0\r");
//    if(w & 0x0002) Uart.Printf("RTS 1\r");
//    else Uart.Printf("RTS 0\r");
}

// Handler of non-standard control pkt
EpState_t NonStandardControlRequestHandler(uint8_t **PPtr, uint32_t *PLen) {
    //Uart.Printf("NonStandard Request\r");
    // Check if class type request
    if((Usb.SetupReq.bmRequestType & USB_REQTYPE_TYPEMASK) == USB_REQTYPE_CLASS) {
        switch(Usb.SetupReq.bRequest) {
            case CDC_GET_LINE_CODING:
//                Uart.Printf("GET_LINE_CODING\r");
                *PPtr = (uint8_t*)&LineCoding;
                *PLen = sizeof(LineCoding);
                return esInData;
                break;

            case CDC_SET_LINE_CODING:
//                Uart.Printf("SET_LINE_CODING\r");
                *PPtr = (uint8_t*)&LineCoding;  // Do not use length in setup pkt
                *PLen = sizeof(LineCoding);
                Usb.Events.OnTransactionEnd[0] = SetLineCoding;
                return esOutData;
                break;

            case CDC_SET_CONTROL_LINE_STATE:    // Nothing to do, there are no control lines
//                Uart.Printf("SET_CTRL_LINE_STATE\r");
                SetCtrlLineState();
                return esOutStatus;
                break;
            default: break;
        } // switch
    } // if class
    return esError;
}
#endif

void UsbSerial_t::Init() {
    // Usb events
    Usb.Events.OnCtrlPkt = NonStandardControlRequestHandler;
    Usb.Events.OnReady = OnUsbReady;
    // Queues
    chIQInit(&UsbOutQueue, OutQBuf, CDC_OUTQ_SZ, NULL, NULL);
    Usb.PEpBulkOut->POutQueue = &UsbOutQueue;
    chOQInit(&UsbInQueue, InQBuf, CDC_INQ_SZ, NULL, NULL);
    // Start reception
    Usb.PEpBulkOut->StartOutTransaction();
    PThread = chThdCreateStatic(waUsbSerialThread, sizeof(waUsbSerialThread), NORMALPRIO, (tfunc_t)UsbSerialThread, NULL);
}

void UsbSerial_t::Printf(const char *format, ...) {
    va_list args;
    va_start(args, format);
    kl_print2Queue(&UsbInQueue, format, args);
    va_end(args);
    // Start transmission
    Usb.PEpBulkIn->WriteFromQueue(&UsbInQueue);
}

