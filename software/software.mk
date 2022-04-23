include $(AXISTREAMOUT_DIR)/config.mk

AXISTREAMOUT_SW_DIR:=$(AXISTREAMOUT_DIR)/software

#include
INCLUDE+=-I$(AXISTREAMOUT_SW_DIR)

#headers
HDR+=$(AXISTREAMOUT_SW_DIR)/*.h iob_axistream_out_swreg.h

#sources
SRC+=$(AXISTREAMOUT_SW_DIR)/iob-axistream-out.c

iob_axistream_out_swreg.h: $(AXISTREAMOUT_HW_DIR)/include/iob_axistream_out_swreg.vh
	$(MKREGS) $< SW AXISTREAMOUT 
