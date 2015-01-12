/*
 * usb_serial.h
 *
 *  Created on: 05 но€б. 2013 г.
 *      Author: G.Kruglov
 */

#ifndef USB_SERIAL_H_
#define USB_SERIAL_H_

#include "usb_l.h"

#define CDC_OUTQ_SZ     256
#define CDC_INQ_SZ      256

class UsbSerial_t {
private:
    uint8_t OutQBuf[CDC_OUTQ_SZ], InQBuf[CDC_INQ_SZ];
    InputQueue UsbOutQueue; // From chibios' point of view, OUT data is input
    OutputQueue UsbInQueue; // From chibios' point of view, IN data is output
public:
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
    // Inner use
    void IOutTask();
};

extern UsbSerial_t UUart;

#endif /* USB_SERIAL_H_ */
