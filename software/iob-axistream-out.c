#include "iob-axistream-out.h"

//AXISTREAMOUT functions

//Set AXISTREAMOUT base address
void axistream_out_init(int base_address){
  IOB_AXISTREAM_OUT_INIT_BASEADDR(base_address);
}

//Place value in FIFO, also place wstrb for word with TLAST signal.
//If tlast_wstrb is zero then all bytes are valid and dont send TLAST signal
//tlast_wstrb has 1 up to 4 bits depending on the output width of the FIFO (width of TDATA signal). 
//If TDATA has 8 bits, then tlast_wstrb has 4 bits (1 for each valid byte of the last 32bit word in FIFO);
//If TDATA has 16 bits, then tlast_wstrb has 2 bits (1 for each valid 16 bit word of the last 32bit word in FIFO);
//If TDATA has 32 bits, then tlast_wstrb has 1 bits (in this case, 32 bits are always valid independently of tlast_wstrb, this bit only selects if we send TLAST signal)
void axistream_out_push(uint32_t value, char tlast_wstrb){
  if(tlast_wstrb)
     IOB_AXISTREAM_OUT_SET_WSTRB_NEXT_WORD_LAST(tlast_wstrb);
  //Set FIFO input value
  IOB_AXISTREAM_OUT_SET_IN(value);
}

//Signal when FIFO is full
bool axistream_out_full(){
  return IOB_AXISTREAM_OUT_GET_FULL();
}
