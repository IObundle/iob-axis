#include <stdlib.h>
#include <stdarg.h>
#include <stdint.h>

#include "iob_axistream_out_swreg.h"

#define AXISTREAMOUT_PROGNAME "IOb-AXISTREAMOUT"

//AXISTREAMOUT functions

//Set AXISTREAMOUT base address
void axistream_out_init(int base_address);

//Get value from FIFO (returns true if this is last byte from stream)
bool axistream_out_pop(char *returnValue);

//Signal when FIFO empty
bool axistream_out_empty();

