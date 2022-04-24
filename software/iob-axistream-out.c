#include "iob-axistream-out.h"

//AXISTREAMOUT functions

//Set AXISTREAMOUT base address
void axistream_out_init(int base_address){
  AXISTREAMOUT_INIT_BASEADDR(base_address);
}

//Place value in FIFO, also place indicator of last byte (TLAST)
void axistream_out_push(char value, bool last){
  //Set FIFO input values
  AXISTREAMOUT_SET_IN(value);
  AXISTREAMOUT_SET_TLAST(last);
  //Store in FIFO
  AXISTREAMOUT_SET_NEXT(1);
  AXISTREAMOUT_SET_NEXT(0);
}

//Signal when FIFO is full
bool axistream_out_full(){
  return AXISTREAMOUT_GET_FULL();
}
