/*
 * evt_mask.h
 *
 *  Created on: Apr 12, 2013
 *      Author: g.kruglov
 */

#ifndef EVT_MASK_H_
#define EVT_MASK_H_

// Event masks
#define EVTMSK_PILL_CHECK       EVENT_MASK(2)
#define EVTMSK_MEASURE_TIME     EVENT_MASK(4)
#define EVTMSK_MEASUREMENT_DONE EVENT_MASK(5)
#define EVTMSK_UART_RX_POLL     EVENT_MASK(6)


/* Radio */
#define EVTMSK_NEW_CMD          EVENT_MASK(7)
#define EVTMSK_RADIO_INIT       EVENT_MASK(8)
#define EVTMSK_RADIO_ACK        EVENT_MASK(9)

#endif /* EVT_MASK_H_ */
