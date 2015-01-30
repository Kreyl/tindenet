/*
 * usb_serial.h
 *
 *  Created on: 05 но€б. 2013 г.
 *      Author: G.Kruglov
 */

#ifndef USB_SERIAL_H_
#define USB_SERIAL_H_

#include "cmd_uart.h"
#include "usb_l.h"
#include "cmd_list.h"
#include "evt_mask.h"
#include "application.h"

#define CDC_OUTQ_SZ     256
#define CDC_INQ_SZ      256

#define END_OF_COMMAND  "\n\r"

class UsbSerial_t {
private:
    uint8_t OutQBuf[CDC_OUTQ_SZ], InQBuf[CDC_INQ_SZ];
    InputQueue UsbOutQueue; // From chibios' point of view, OUT data is input
    OutputQueue UsbInQueue; // From chibios' point of view, IN data is output
public:
    Semaphore ISemaphore;
    Thread *PThread;
    uint8_t BytesToRead;
    void Init();
    void SendBuf(uint8_t *PBuf, uint32_t Len) {
        chOQWriteTimeout(&UsbInQueue, PBuf, Len, TIME_INFINITE);
        Usb.PEpBulkIn->WriteFromQueue(&UsbInQueue);
    }
    uint8_t GetByte(uint8_t *PByte, systime_t Timeout = TIME_INFINITE) {
        msg_t r = chIQGetTimeout(&UsbOutQueue, Timeout);
        if(r >= 0) {
            *PByte = (uint8_t)r;
            return OK;
        }
        else return FAILURE;
    }
    void Printf(const char *format, ...);

    // Inner use
    void IOutTask();
    Cmd_t ICmd[2], *PCmdWrite = &ICmd[0], *PCmdRead = &ICmd[1];
    void CompleteCmd();
    void ParseCmd(Cmd_t *PCmd);
    void CmdRpl(uint8_t ErrCode, uint32_t Length = 0, uint8_t *Ptr = nullptr);
};

extern UsbSerial_t UsbSerial;

#endif /* USB_SERIAL_H_ */
