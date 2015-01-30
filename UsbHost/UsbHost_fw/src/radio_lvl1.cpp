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
	    int8_t RSSI;
	    uint8_t RxRslt = CC.ReceiveSync(999, &PktRx, &RSSI);
        if(RxRslt == OK) { // Pkt received correctly
            Uart.Printf("Rx: %u %u %d", PktRx.ID, PktRx.State, RSSI);
        }
	}
#else
#ifdef HOST
//
#endif
#endif
} // ITask

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
    _IsInit = true;
}
#endif
