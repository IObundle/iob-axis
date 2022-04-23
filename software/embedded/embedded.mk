ifeq ($(filter AXISTREAMOUT, $(SW_MODULES)),)

SW_MODULES+=AXISTREAOUTM

include $(AXISTREAMOUT_DIR)/software/software.mk

# add embeded sources
SRC+=iob_axistream_out_swreg_emb.c

iob_axistream_out_swreg_emb.c: iob_axistream_out_swreg.h
	

endif
