#include <stdint.h>
#include "iob-axistream-out.h"

//AXISTREAMOUT functions

//Set AXISTREAMOUT base address
void axistream_out_init(int base_address){
  AXISTREAMOUT_INIT_BASEADDR(base_address);
}

//Get value from FIFO (returns true if this is last byte from stream)
bool axistream_out_pop(char *returnValue){
  AXISTREAMOUT_SET_NEXT(1);
  AXISTREAMOUT_SET_NEXT(0);
  *returnValue = AXISTREAMOUT_GET_OUT();
  return AXISTREAMOUT_GET_TLAST();
}

//Signal when FIFO empty
bool axistream_out_empty(){
  return AXISTREAMOUT_GET_EMPTY();
}
