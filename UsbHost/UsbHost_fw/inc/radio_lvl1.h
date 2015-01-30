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



class rLevel1_t {
private:
    bool _IsInit;
    rPkt_t PktRx;
    uint32_t LastTime;
public:
    bool IsInit() { return _IsInit; }
    void Init();
    // Inner use
    Thread *rThd;
    void ITask();
    void IIterateChannels();
};

extern rLevel1_t Radio;

#endif /* RADIO_LVL1_H_ */
