ifeq ($(filter AXISTREAMOUT, $(HW_MODULES)),)

include $(AXISTREAMOUT_DIR)/config.mk

#add itself to HW_MODULES list
HW_MODULES+=AXISTREAOUTM

#include iob_fifo_sync
include $(MEM_DIR)/hardware/fifo/iob_fifo_sync/hardware.mk
include $(MEM_DIR)/hardware/ram/iob_ram_2p/hardware.mk
include $(MEM_DIR)/hardware/ram/iob_ram_2p_asym/hardware.mk

AXISTREAMOUT_INC_DIR:=$(AXISTREAMOUT_HW_DIR)/include
AXISTREAMOUT_SRC_DIR:=$(AXISTREAMOUT_HW_DIR)/src

USE_NETLIST ?=0

#include files
VHDR+=$(wildcard $(AXISTREAMOUT_INC_DIR)/*.vh)
VHDR+=iob_axistream_out_swreg_gen.vh iob_axistream_out_swreg_def.vh
VHDR+=$(LIB_DIR)/hardware/include/iob_lib.vh

#hardware include dirs
INCLUDE+=$(incdir). $(incdir)$(AXISTREAMOUT_INC_DIR) $(incdir)$(LIB_DIR)/hardware/include

#sources
VSRC+=$(AXISTREAMOUT_SRC_DIR)/iob_axistream_out.v

axistream-out-hw-clean: axistream-out-gen-clean
	@rm -f *.v *.vh

.PHONY: axistream-out-hw-clean

endif
