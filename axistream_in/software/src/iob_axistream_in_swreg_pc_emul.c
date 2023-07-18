/* PC Emulation of axistream-in peripheral */

#include <stdint.h>

#include "iob_axistream_in_swreg.h"


// Base Address
static int base;
void IOB_AXISTREAM_IN_INIT_BASEADDR(uint32_t addr) {
  base = addr;
}

// Core Setters and Getters
uint32_t IOB_AXISTREAM_IN_GET_OUT() {
  return 0x00;
}

uint8_t IOB_AXISTREAM_IN_GET_EMPTY() {
  return 0x01;
}

uint8_t IOB_AXISTREAM_IN_GET_LAST() {
  return 0x00;
}

void IOB_AXISTREAM_IN_SET_SOFTRESET(uint8_t value) {
}

void IOB_AXISTREAM_IN_SET_ENABLE(uint8_t value) {
}

uint16_t IOB_AXISTREAM_IN_GET_VERSION() {
    return 0xaaaa;
}

