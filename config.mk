TOP_MODULE=iob_axistream_out

#PATHS
REMOTE_ROOT_DIR ?=sandbox/iob-axistream-out
SIM_DIR ?=$(AXISTREAMOUT_HW_DIR)/simulation
FPGA_DIR ?=$(shell find $(AXISTREAMOUT_DIR)/hardware -name $(FPGA_FAMILY))
DOC_DIR ?=$(AXISTREAMOUT_DIR)/document/$(DOC)

LIB_DIR ?=$(AXISTREAMOUT_DIR)/submodules/LIB
MEM_DIR ?=$(AXISTREAMOUT_DIR)/submodules/MEM
AXISTREAMOUT_HW_DIR:=$(AXISTREAMOUT_DIR)/hardware

#MAKE SW ACCESSIBLE REGISTER
MKREGS:=$(shell find $(LIB_DIR) -name mkregs.py)

#DEFAULT FPGA FAMILY AND FAMILY LIST
FPGA_FAMILY ?=CYCLONEV-GT
FPGA_FAMILY_LIST ?=CYCLONEV-GT XCKU

#DEFAULT DOC AND doc LIST
DOC ?=pb
DOC_LIST ?=pb ug

# VERSION
VERSION ?=V0.1
$(TOP_MODULE)_version.txt:
	echo $(VERSION) > version.txt

#cpu accessible registers
iob_axistream_out_swreg_def.vh iob_axistream_out_swreg_gen.vh: $(AXISTREAMOUT_DIR)/mkregs.conf
	$(MKREGS) iob_axistream_out $(AXISTREAMOUT_DIR) HW

axistream-out-gen-clean:
	@rm -rf *# *~ version.txt

.PHONY: axistream-out-gen-clean
