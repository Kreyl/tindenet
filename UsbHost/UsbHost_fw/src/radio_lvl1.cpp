/*
 * radio_lvl1.cpp
 *
 *  Created on: Nov 17, 2013
 *      Author: kreyl
 */

#include "radio_lvl1.h"
#include "evt_mask.h"
#include "application.h"
#include "cc1101.h"
#include "cmd_uart.h"
#include "led_rgb.h"
#include "peripheral.h"
#include "sequences.h"

//#define DBG_PINS

#ifdef DBG_PINS
#define DBG_GPIO1   GPIOC
#define DBG_PIN1    15
#define DBG1_SET()  PinSet(DBG_GPIO1, DBG_PIN1)
#define DBG1_CLR()  PinClear(DBG_GPIO1, DBG_PIN1)
#endif

rLevel1_t Radio;

void WaitRplCallback(void *p) {
    chSysLockFromIsr();
    chEvtSignalI(Radio.rThd, EVTMSK_UART_RX_POLL);
    chSysUnlockFromIsr();
}

static WORKING_AREA(warLvl1Thread, 256);
__attribute__ ((__noreturn__))
static void rLvl1Thread(void *arg) {
    chRegSetThreadName("rLvl1");
    while(true) Radio.ITask();
}

__attribute__ ((__noreturn__))
void rLevel1_t::ITask() {
	// Radio Task
#ifdef CLIENT
    while(true) {
        CheckState();
        int8_t RSSI;
        uint8_t RxRslt;
        switch (_State) {
            case rsIdle:
                RxRslt = CC.ReceiveSync(99, &PktRx, &RSSI);
                if(RxRslt == OK) { // Pkt received correctly
                    Uart.Printf("\r\nRx: %u %u {%u,%u,%u} %d", PktRx.ID, PktRx.State, PktRx.Red, PktRx.Green, PktRx.Blue, RSSI);
                    switch (PktRx.State) {
                        case 0x01:
                            Uart.Printf("\r\nLedSet");
                            Led.SetColor((Color_t){PktRx.Red, PktRx.Green, PktRx.Blue});
                            SetState(rsWaitAckOrRpl);
                            chEvtSignalI(App.PThd, EVTMSK_RADIO_ACK);
                            break;
                        default:
                            break;
                    }
                }
                break;

            case rsOff:
            case rsWaitAckOrRpl:
                chThdSleepMilliseconds(9);
                break;
        } // switch

	}
#else
#ifdef HOST
    while(true) {
        CheckState();
        switch (_State) {
            case rsWaitAckOrRpl:
                break;

            case rsIdle:
            case rsOff:
                chThdSleepMilliseconds(999);
                break;
        } // switch
    } // while
#endif
#endif
} // ITask

uint8_t rLevel1_t::WaitRpl() {
    int8_t RSSI;
    uint8_t RxRslt = CC.ReceiveSync(RADIO_WAIT_ACK_MS, &PktRx, &RSSI);
    Uart.Printf("\r\nRpl %u", RxRslt);
    if(RxRslt == OK) { // Pkt received correctly
    }
    return RxRslt;
}

#if 1 // ============================
void rLevel1_t::Init() {
#ifdef DBG_PINS
    PinSetupOut(DBG_GPIO1, DBG_PIN1, omPushPull);
    DBG1_CLR();
#endif
    // Init radioIC
    CC.Init();
    CC.SetTxPower(CC_PwrMinus15dBm);
    CC.SetChannel(0);
    CC.SetPktSize(RPKT_LEN);
    // Thread
    rThd = chThdCreateStatic(warLvl1Thread, sizeof(warLvl1Thread), HIGHPRIO, (tfunc_t)rLvl1Thread, NULL);
    _State = rsIdle;
}
#endif
