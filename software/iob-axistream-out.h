#include <stdbool.h>

#include "iob_axistream_out_swreg.h"

//AXISTREAMOUT functions

//Set AXISTREAMOUT base address
void axistream_out_init(int base_address);

//Place value in FIFO, also place indicator of last byte (TLAST)
void axistream_out_push(char value, bool last);

//Signal when FIFO is full
bool axistream_out_full();

