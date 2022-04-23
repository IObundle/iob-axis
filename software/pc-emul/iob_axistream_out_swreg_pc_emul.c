/* PC Emulation of AXISTREAMOUT peripheral */

#include <stdint.h>
#include <stdio.h>

#include "iob_axistream_out_swreg.h"

static uint16_t div_value;

void AXISTREAMOUT_INIT_BASEADDR(uint32_t addr) {
    base = addr;
    return;
}

//Get value from FIFO (returns true if this is last byte from stream)
bool axistream_out_pop(char *returnValue){
  *returnValue = 0;
  return 1;
}

//Signal when FIFO empty
bool axistream_out_empty(){
  return 0;
}
