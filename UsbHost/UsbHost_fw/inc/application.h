/*
 * application.h
 *
 *  Created on: Nov 9, 2013
 *      Author: kreyl
 */

#ifndef APPLICATION_H_
#define APPLICATION_H_

#include "kl_lib_L15x.h"
#include "sequences.h"
#include "cmd_uart.h"
#include "usb_serial.h"

// Addresses
#define EE_DEVICE_ID_ADDR       0

#define INS_OFFSET              0
#define DATA_OFFSET             1


//#define HOST
#define CLIENT

// Host Command Class
#define MAX_HOST_CMD_SIZE   32
class HostCommand_t {
private:
    uint8_t CmdBuffer[MAX_HOST_CMD_SIZE];
    uint8_t *PToWrite;
public:
    uint8_t *PBufCmd;
    uint8_t CmdLength;
    void Init()     { PBufCmd = CmdBuffer;  Reset(); }
    void Reset()    { CmdLength = 0; PToWrite = CmdBuffer; }
    uint8_t PutValue(uint8_t *PVal) {
        if(PToWrite >= (CmdBuffer + MAX_HOST_CMD_SIZE)) return FAILURE;
        *PToWrite++ = *PVal;
        CmdLength++;
        return OK;
    }
};


// ==== Application class ====
class App_t {
private:
    uint8_t ISetID(uint32_t NewID);
    Eeprom_t EE;
public:
    uint32_t SelfID;
    Thread *PThd;
    HostCommand_t HostCommand;
    // Timers
    VirtualTimer TmrUartRx;
    // Radio & UsbSerial
    void Init();
    void Task();
    // Events
    void OnUartCmd(Cmd_t *PCmd);
};

extern App_t App;

#endif /* APPLICATION_H_ */
