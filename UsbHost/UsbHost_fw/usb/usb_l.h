/*
 * usb_l.h
 *
 *  Created on: Jul 5, 2013
 *      Author: g.kruglov
 */

#ifndef USB_L_H_
#define USB_L_H_

#include "ch.h"
#include "hal.h"
#include "stm32_usb.h"
#include "kl_lib_L15x.h"
#include "descriptors.h"


#if 1 // ============================ Endpoint =================================
enum EpState_t {esIdle, esSetup, esInData, esOutData, esInStatus, esOutStatus, esError};

class Ep_t {
private:
    uint8_t Indx;
    EpState_t State;
    uint8_t *PtrIn, *PtrOut;
    uint32_t LengthIn, LengthOut;
    OutputQueue *PInQueue;
public:
    bool TransmitFinalZeroPkt;
    InputQueue *POutQueue;
    void Init(const EpCfg_t *PCfg);
    void SetStallIn()   { EPR_SET_STAT_TX(Indx, EPR_STAT_TX_STALL); }
    void SetStallOut()  { EPR_SET_STAT_RX(Indx, EPR_STAT_RX_STALL); }
    bool IsStalledIn()  { return (STM32_USB->EPR[Indx] & EPR_STAT_TX_MASK) == EPR_STAT_TX_STALL; }
    bool IsStalledOut() { return (STM32_USB->EPR[Indx] & EPR_STAT_RX_MASK) == EPR_STAT_RX_STALL; }
    void FillInBuf();
    void StartInTransaction()  { EPR_SET_STAT_TX(Indx, EPR_STAT_TX_VALID); }
    void StartOutTransaction() { EPR_SET_STAT_RX(Indx, EPR_STAT_RX_VALID); }
    void TransmitDataChunk() { FillInBuf(); StartInTransaction(); }
    void TransmitZeroPkt();
    void ReceiveZeroPkt();
    void ReadToBuf(uint8_t *PDstBuf, uint16_t Len);
    void ReadToQueue(uint16_t Len);
    void WriteFromQueue(OutputQueue *PQ);
    uint16_t GetRxDataLength();
    void FlushRx(uint16_t Len);
    Thread *PThread;
    inline void ResumeWaitingThd(msg_t ReadyMsg);
    friend class Usb_t;
};
#endif

struct UsbSetupReq_t {
    uint8_t  bmRequestType;
    uint8_t  bRequest;
    union {
        uint16_t wValue;
        struct {
            uint8_t Indx;
            uint8_t Type;
        };
    };
    uint16_t wIndex;
    uint16_t wLength;
} __attribute__ ((__packed__));

#if 1 // ========================== Usb ========================================
// Functional type for unhandled ctrl pkt
typedef EpState_t (*ftCtrlPkt)(uint8_t **PPtr, uint32_t *PLen);

struct UsbEvents_t {
    ftVoidVoid OnReady;
    ftVoidVoid OnWakeup;
    ftVoidVoid OnSuspend;
    ftCtrlPkt  OnCtrlPkt;
    ftVoidVoid OnTransactionEnd[EP_CNT];
};

class Usb_t {
private:
    Ep_t Ep[EP_CNT];
    uint8_t Ep0InBuf[EP0_SZ];
    void IReset();
    void ISuspend();
    void IWakeup();

    void ICtrHandlerIN(uint16_t EpID);
    void ICtrHandlerOUT(uint16_t EpID, uint16_t Epr);
    uint16_t PktMemNext;
    void PktMemReset();
    uint16_t PktMemAlloc(uint16_t Sz);
    void SetupPktHandler();
    EpState_t DefaultReqHandler(uint8_t **PPtr, uint32_t *PLen);
    void PrepareInTransaction(uint8_t *Ptr, uint32_t ALen);
    uint8_t Configuration;
public:
    bool IsReady;
    UsbEvents_t Events;
    void Init();
    void Connect()    { SYSCFG->PMC |=  SYSCFG_PMC_USB_PU; }
    void Disconnect() { SYSCFG->PMC &= ~SYSCFG_PMC_USB_PU; }
    // Data operations
    union {
        uint8_t Ep0OutBuf[EP0_SZ];
        UsbSetupReq_t SetupReq;
    };
    Ep_t *PEpBulkOut, *PEpBulkIn;
    void StartTransmitBuf(uint8_t EpID, uint8_t *Ptr, uint32_t ALen);
    uint8_t WaitTransactionEnd(uint8_t EpID);
    // Inner use
    void IIrqHandler();
    friend class Ep_t;
    friend class UsbSerial_t;
};

extern Usb_t Usb;
#endif

// ============================== Constants ====================================
#define USB_REQ_GET_STATUS                  0
#define USB_REQ_CLEAR_FEATURE               1
#define USB_REQ_SET_FEATURE                 3
#define USB_REQ_SET_ADDRESS                 5
#define USB_REQ_GET_DESCRIPTOR              6
#define USB_REQ_SET_DESCRIPTOR              7
#define USB_REQ_GET_CONFIGURATION           8
#define USB_REQ_SET_CONFIGURATION           9
#define USB_REQ_GET_INTERFACE               10
#define USB_REQ_SET_INTERFACE               11
#define USB_REQ_SYNCH_FRAME                 12

#define USB_FEATURE_ENDPOINT_HALT           0
#define USB_FEATURE_DEVICE_REMOTE_WAKEUP    1
#define USB_FEATURE_TEST_MODE               2

// Setup request type (bmRequestType)
#define USB_REQTYPE_DEV2HOST                (1<<7)
#define USB_REQTYPE_HOST2DEV                (0<<7)

#define USB_REQTYPE_TYPEMASK                0x60
#define USB_REQTYPE_STANDARD                (0<<5)
#define USB_REQTYPE_CLASS                   (1<<5)
#define USB_REQTYPE_VENDOR                  (2<<5)
#define USB_REQTYPE_RECIPIENT_MASK          0x1F
#define USB_REQTYPE_RECIPIENT_DEVICE        0x00
#define USB_REQTYPE_RECIPIENT_INTERFACE     0x01
#define USB_REQTYPE_RECIPIENT_ENDPOINT      0x02
#define USB_REQTYPE_RECIPIENT_OTHER         0x03


#endif /* USB_L_H_ */
