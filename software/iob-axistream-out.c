#include "iob-axistream-out.h"

//AXISTREAMOUT functions

//Set AXISTREAMOUT base address
void axistream_out_init(int base_address){
  IOB_AXISTREAM_OUT_INIT_BASEADDR(base_address);
}

//Place value in FIFO, also place indicator of last byte (TLAST)
void axistream_out_push(char value, bool last){
  //Set FIFO input value with TLAST in msb
  IOB_AXISTREAM_OUT_SET_IN(last<<8 | value);
}

//Signal when FIFO is full
bool axistream_out_full(){
  return IOB_AXISTREAM_OUT_GET_FULL();
}
