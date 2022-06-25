#include <stdbool.h>

#include "iob_axistream_out_swreg.h"

//AXISTREAMOUT functions

//Set AXISTREAMOUT base address
void axistream_out_init(int base_address);

//Place value in FIFO, also place wstrb for word with TLAST signal.
void axistream_out_push(uint32_t value, char tlast_wstrb){

//Signal when FIFO is full
bool axistream_out_full();

