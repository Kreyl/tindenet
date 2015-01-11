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

#if 1 // ================================ Pill =================================
void App_t::OnPillConnect() {
    if(PillMgr.Read(PILL_I2C_ADDR, PILL_START_ADDR, &Pill, sizeof(Pill_t)) != OK) return;
    // Print pill
    Uart.Printf("#PillRead32 0 16\r\n");
    Uart.Printf("#PillData32 ");
    int32_t *p = (int32_t*)&Pill;
    for(uint32_t i=0; i<PILL_SZ32; i++) Uart.Printf("%d ", *p++);
    Uart.Printf("\r\n");
    uint8_t rslt __attribute__((unused));
    switch(Pill.TypeID) {
#if 1 // ==== Set ID ====
        case PILL_TYPEID_SET_ID:
            Pill.DeviceID++;
            rslt = PillMgr.Write(PILL_I2C_ADDR, 0, &Pill, PILL_SZ);
            if(rslt == OK) {
                ISetID(Pill.DeviceID-1);
                Led.StartSequence(LedGoodID);
                Beeper.Beep(BeepPillOk);
            }
            else {
                Uart.Printf("Pill Write Error\r");
                Led.StartSequence(LedBadID);
                Beeper.Beep(BeepPillBad);
            }
            chThdSleepMilliseconds(1800);
            break;
#endif

        default:
            Uart.Printf("Unknown Pill\r");
            Beeper.Beep(BeepPillBad);
            break;
    } // switch
}
#endif

#if 1 // ======================= Command processing ============================
void App_t::OnUartCmd(Cmd_t *PCmd) {
    Uart.Printf("%S\r", PCmd->Name);
    uint8_t b;
    uint32_t dw32 __attribute__((unused));  // May be unused in some cofigurations
    if(PCmd->NameIs("#Ping")) Uart.Ack(OK);
    else if(*PCmd->Name == '#') Uart.Ack(CMD_UNKNOWN);  // reply only #-started stuff
}
#endif


#if 1 // ========================= Application =================================
void App_t::Init() {
    SelfID = EE.Read32(EE_DEVICE_ID_ADDR);  // Read device ID
#ifdef MIST_SUPPORT_CHIBI
    mist_msec_ctr=-1;
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
