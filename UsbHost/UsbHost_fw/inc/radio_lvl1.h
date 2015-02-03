/*
 * radio_lvl1.h
 *
 *  Created on: Nov 17, 2013
 *      Author: kreyl
 */

#ifndef RADIO_LVL1_H_
#define RADIO_LVL1_H_

#include "ch.h"
#include "rlvl1_defins.h"
#include "kl_lib_L15x.h"
#include "cc1101.h"


#define RADIO_WAIT_ACK_MS   999

#define RadioAck  ((rPkt_t){0x42, 0x63, 0x6B, 0x4F, 0x4B})

enum RadioState_t {
    rsOff = 0, rsWaitAckOrRpl = 1, rsIdle = 2
};

class rLevel1_t {
private:
    RadioState_t _State, NeedState;
    rPkt_t PktRx;
    uint32_t LastTime;
    Thread *PWaitThd;
    void CheckState() {  _State = (NeedState == _State)? NeedState : _State; }
    VirtualTimer WairRplTmr;
public:
    rPkt_t PktTx;
    bool IsInit() { return (_State == rsIdle); }
    void Init();
    // Inner use
    Thread *rThd;
    void SetState(RadioState_t nState) { NeedState = nState; }
    void ITask();
    uint8_t WaitRpl();
};

extern rLevel1_t Radio;

#endif /* RADIO_LVL1_H_ */
