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


#if 1 // ========================= Application =================================
void App_t::Init() {
    HostCommand.Init();
    SelfID = EE.Read32(EE_DEVICE_ID_ADDR);  // Read device ID
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
