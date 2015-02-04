/*
 * application.cpp
 *
 *  Created on: Nov 9, 2013
 *      Author: kreyl
 */

#include "application.h"
#include "cmd_uart.h"
#include "pill_mgr.h"
#include "peripheral.h"
#include "evt_mask.h"
#include "eestore.h"
#include "radio_lvl1.h"
#include <cstdlib>
#include "led_rgb.h"

App_t App;
extern void TmrMeasurementCallback(void *p) __attribute__((unused));

#if 1 // ======================= Command processing ============================
void App_t::OnUartCmd(Cmd_t *PCmd) {
    Uart.Printf("%S\r", PCmd->Name);
    uint8_t b;
    uint32_t dw32 __attribute__((unused));  // May be unused in some cofigurations
    if(PCmd->NameIs("#Ping")) Uart.Ack(OK);
    else if(*PCmd->Name == '#') Uart.Ack(CMD_UNKNOWN);  // reply only #-started stuff
}
#endif


void App_t::Task() {
    uint32_t EvtMsk = chEvtWaitAny(ALL_EVENTS);
    if(EvtMsk & EVTMSK_UART_RX_POLL) Uart.PollRx(); // Check if new cmd received
#ifdef CLIENT
    if(EvtMsk & EVTMSK_RADIO_ACK) {
        Radio.PktTx = RadioAck;
        Radio.PktTx.ID = SelfID;
        chThdSleepMilliseconds(41); // wait Host to go in Rx state
        CC.TransmitSync(&Radio.PktTx); // Send Ack
        Radio.SetState(rsIdle);
    }
#endif


#ifdef HOST
    if(EvtMsk & EVTMSK_NEW_CMD) {
        Uart.Printf("\r\nNewCmd: %A", hCommand.PCmd, hCommand.CmdLength, ' ');
        switch (hCommand.CmdType) {
            case 0x01:
                if(Radio.IsInit()) {
                    PinToggle(GPIOB, 1);
                    Radio.PktTx.ID      = hCommand.RecipientID; // Id to send
                    Radio.PktTx.CmdType = hCommand.CmdType;
                    Radio.PktTx.Red     = hCommand.Data[0];
                    Radio.PktTx.Green   = hCommand.Data[1];
                    Radio.PktTx.Blue    = hCommand.Data[2];
                    CC.TransmitSync(&Radio.PktTx);
                    uint8_t Rslt = Radio.WaitRpl();
                    UsbSerial.CmdRpl(Rslt);
                }
                else UsbSerial.CmdRpl(FAILURE);
                break;

            case 0x02:
                Uart.Printf("\r\nCmd2");
                UsbSerial.CmdRpl(OK);
                break;

            default:
                Uart.Printf("\r\nUnknown");
                UsbSerial.CmdRpl(CMD_UNKNOWN);
                break;
        }
    }

    if(EvtMsk & EVTMSK_RADIO_INIT) {
        Uart.Printf("\r\nRadioInit");
        if(!Radio.IsInit()) Radio.Init();
        UsbSerial.CmdRpl(OK);
    }
#endif
}


#if 1 // ========================= Application =================================
void App_t::Init() {
    hCommand.Init();
#ifdef CLIENT
    SelfID = EE.Read32(EE_DEVICE_ID_ADDR);  // Read device ID
    Uart.Printf("\r\nApp ID: %u", SelfID);
#else
#ifdef HOST
    Uart.Printf("\r\nApp Host");
#endif
#endif
}

uint8_t App_t::ISetID(uint32_t NewID) {
    if(NewID > 0xFFFF) return FAILURE;
    uint8_t rslt = EE.Write32(EE_DEVICE_ID_ADDR, NewID);
    if(rslt == OK) {
        SelfID = NewID;
        Uart.Printf("\r\nNew ID: %u", SelfID);
        return OK;
    }
    else {
        Uart.Printf("\r\nEE error: %u", rslt);
        return FAILURE;
    }
}
#endif
