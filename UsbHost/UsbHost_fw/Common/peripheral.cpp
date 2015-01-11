/*
 * peripheral.cpp
 *
 *  Created on: 18.01.2013
 *      Author: kreyl
 */

#include "ch.h"
#include "hal.h"
#include "clocking_L1xx.h"
#include "peripheral.h"
#include "cmd_uart.h"

#if 1 // =============================== Beep ==================================
#define BEEP_TOP_VALUE   22
Beeper_t Beeper;
// Timer callback
void BeeperTmrCallback(void *p) {
    chSysLockFromIsr();
    Beeper.BeepI((const BeepChunk_t*)p);
    chSysUnlockFromIsr();
}

void Beeper_t::Init() {
    IPin.Init(GPIOB, 3, TIM2, 2, BEEP_TOP_VALUE);
}

void Beeper_t::BeepI(const BeepChunk_t *PSequence) {
    // Reset timer
    if(chVTIsArmedI(&ITmr)) chVTResetI(&ITmr);
    if(PSequence == nullptr) {
        IPin.Off();
        return;
    }
    // Set sound
    IPin.SetFreqHz(PSequence->Freq_Hz);
    IPin.Set(PSequence->Volume);
    // Proceed sequence, stop it or restart
    const BeepChunk_t *PCh = nullptr;
    switch(PSequence->ChunkSort) {
        case ckNormal: PCh = PSequence + 1; break;
        case ckEnd:                        break;
        case ckJump: PCh = IPFirstChunk;  break;
    }
    // Start timer
    chVTSetI(&ITmr, MS2ST(PSequence->Time_ms), BeeperTmrCallback, (void*)PCh);
}

void Beeper_t::Shutdown() {
    PinSetupAnalog(GPIOB, 3);
}
#endif

#if VIBRO_ENABLED // ======================= Vibro =============================
Vibro_t Vibro;
#define VIBRO_TOP_VALUE   22

// Timer callback
void VibroTmrCallback(void *p) {
    chSysLockFromIsr();
    Vibro.IFlinchI((const VibroChunk_t*)p);
    chSysUnlockFromIsr();
}

void Vibro_t::Init() {
    PinSetupOut(GPIOB, 6, omPushPull, pudNone);
}

void Vibro_t::IFlinchI(const VibroChunk_t *PSequence) {
    // Reset timer
    if(chVTIsArmedI(&ITmr)) chVTResetI(&ITmr);
    if(PSequence == nullptr) {
        PinClear(VIBRO_GPIO, VIBRO_PIN);
        return;
    }
    // Set vibro pwr
    if(PSequence->OnOff == stOn) PinSet(VIBRO_GPIO, VIBRO_PIN);
    else PinClear(VIBRO_GPIO, VIBRO_PIN);
    // Proceed with sequence, stop it or restart
    const VibroChunk_t *PCh = nullptr;
    switch(PSequence->ChunkKind) {
        case ckNormal: PCh = PSequence + 1; break;
        case ckStop:                        break;
        case ckRepeat: PCh = IPFirstChunk;  break;
    }
    // Start timer
    chVTSetI(&ITmr, MS2ST(PSequence->Time_ms), VibroTmrCallback, (void*)PCh);
}
#endif
