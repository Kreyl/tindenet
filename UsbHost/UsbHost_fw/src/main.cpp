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
#include "usb_serial.h"
#include "usb_l.h"
#include "led_rgb.h"

inline void Init();

void TmrUartRxCallback(void *p) {
    chSysLockFromIsr();
    chEvtSignalI(App.PThd, EVTMSK_UART_RX_POLL);
    chVTSetI(&App.TmrUartRx, MS2ST(UART_RX_POLLING_MS), TmrUartRxCallback, nullptr);
    chSysUnlockFromIsr();
}

int main(void) {
    // ==== Init Vcore & clock system ====
#ifdef CLIENT
    SetupVCore(vcore1V2);
#else
#ifdef HOST
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
#endif
#endif
    Clk.UpdateFreqValues();

    // ==== Init OS ====
    halInit();
    chSysInit();

    Init();
#ifdef HOST
    if(ClkResult) Uart.Printf("Clock failure\r");
    PinSetupOut(GPIOB, 1, omPushPull, pudNone, ps10MHz);
#endif

    // Timers
    chSysLock();
    chVTSetI(&App.TmrUartRx,    MS2ST(UART_RX_POLLING_MS), TmrUartRxCallback, nullptr);
    chSysUnlock();

    // Event-generating framework
    while(true) {
        uint32_t EvtMsk = chEvtWaitAny(ALL_EVENTS);
        // ==== Uart cmd ====
        if(EvtMsk & EVTMSK_UART_RX_POLL) Uart.PollRx(); // Check if new cmd received
#ifdef HOST
        if(EvtMsk & EVTMSK_NEW_CMD) {
            Uart.Printf("\r\nNewCmd: %A", App.HostCommand.PBufCmd, App.HostCommand.CmdLength, ' ');
            switch (App.HostCommand.PBufCmd[INS_OFFSET]) {
                case 0x01:
                    if(Radio.IsInit()) {
                        PinToggle(GPIOB, 1);
                        Radio.PktTx.ID = 0x01;
                        Radio.PktTx.State = 0x01;
                        Radio.PktTx.Red   = App.HostCommand.PBufCmd[DATA_OFFSET];
                        Radio.PktTx.Green = App.HostCommand.PBufCmd[DATA_OFFSET+1];
                        Radio.PktTx.Blue  = App.HostCommand.PBufCmd[DATA_OFFSET+2];
                        CC.TransmitSync(&Radio.PktTx);
                        UsbSerial.CmdRpl(OK);
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
            Radio.Init();
            UsbSerial.CmdRpl(OK);
        }
#endif
    } // while true

}

void Init() {
    // ==== Init Hard & Soft ====
    Uart.Init(115200);
    Led.Init();
//    PowerLed.Init();
//    PowerLed.On();

    App.Init();
    App.PThd = chThdSelf();
#ifdef CLIENT
    Radio.Init();
#endif

    Uart.Printf("\r\nTindenet Client \r\nAHB=%u Mhz; APB1=%u Mhz; APB2=%u Mhz", Clk.AHBFreqHz/1000000, Clk.APB1FreqHz/1000000, Clk.APB2FreqHz/1000000);
#ifdef HOST
    Usb.Init();
    Usb.Connect();
    UsbSerial.Init();
#endif

}

