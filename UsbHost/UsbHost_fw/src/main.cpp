/*
 * File:   main.cpp
 * Author: Kreyl
 * Project: ChibiArmlet-Atlantis
 *
 * Created on Feb 05, 2013, 20:27
 */

#include "kl_lib_L15x.h"
#include "ch.h"
#include "hal.h"
#include "clocking_L1xx.h"
#include "cmd_uart.h"
#include "application.h"
#include "radio_lvl1.h"
#include "evt_mask.h"
#include "usb_l.h"


inline void Init();

void TmrUartRxCallback(void *p) {
    chSysLockFromIsr();
    chEvtSignalI(App.PThd, EVTMSK_UART_RX_POLL);
    chVTSetI(&App.TmrUartRx, MS2ST(UART_RX_POLLING_MS), TmrUartRxCallback, nullptr);
    chSysUnlockFromIsr();
}

int main(void) {
    // ==== Init Vcore & clock system ====
    SetupVCore(vcore1V8);
    Clk.SetupFlashLatency(24);
    uint8_t ClkResult = 1;
    // 12 MHz * 8 = ; 12*8 = 96 MHz; 96 / 4 = 24 Mhz; Clocking to USB PLLVCO/2 = ((HSE*PLLMUL)/2) = 48 Mhz
    Clk.SetupPLLMulDiv(pllMul8, pllDiv4);
    Clk.SetupBusDividers(ahbDiv1, apbDiv1, apbDiv1);
    if((ClkResult = Clk.SwitchToPLL()) == 0) {
        Clk.DisableHSI();
        Clk.DisableMSI();
    }
    Clk.UpdateFreqValues();

    // ==== Init OS ====
    halInit();
    chSysInit();

    Init();
    if(ClkResult) Uart.Printf("Clock failure\r");

    // Timers
    chSysLock();
    chVTSetI(&App.TmrUartRx,    MS2ST(UART_RX_POLLING_MS), TmrUartRxCallback, nullptr);
    chSysUnlock();

    // Event-generating framework
    while(true) {
        uint32_t EvtMsk = chEvtWaitAny(ALL_EVENTS);
        // ==== Uart cmd ====
        if(EvtMsk & EVTMSK_UART_RX_POLL) Uart.PollRx(); // Check if new cmd received
    } // while true

}

void Init() {
    // ==== Init Hard & Soft ====
    Uart.Init(115200);
//    Led.Init();

    App.Init();
    App.PThd = chThdSelf();
//    Radio.Init();

    Uart.Printf("\r\nTindenet \r\nAHB=%u Mhz; APB1=%u Mhz; APB2=%u Mhz", Clk.AHBFreqHz/1000000, Clk.APB1FreqHz/1000000, Clk.APB2FreqHz/1000000);

    Usb.Init();
    Usb.Connect();
}
