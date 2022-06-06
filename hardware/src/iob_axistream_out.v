`timescale 1ns/1ps
`include "iob_lib.vh"
`include "iob_axistream_out_swreg_def.vh"

module iob_axistream_out 
  # (
     parameter DATA_W = 32, //PARAM CPU data width
     parameter ADDR_W = `iob_axistream_out_swreg_ADDR_W, //MACRO CPU address section width
	  parameter FIFO_DEPTH_LOG2 = 10
     )

  (

   //CPU interface
`include "iob_s_if.vh"

   //additional inputs and outputs
   `IOB_OUTPUT(tdata, 8),
   `IOB_OUTPUT(tvalid, 1),
   `IOB_INPUT(tready, 1),
   `IOB_OUTPUT(tlast, 1), 
`include "iob_gen_if.vh"
   );

//BLOCK Register File & Configuration control and status register file.
`include "iob_axistream_out_swreg_gen.vh"
   
   `IOB_WIRE(fifo_empty, 1)
   `IOB_VAR(tvalid_tmp, 1)
   //FIFO RAM
   `IOB_WIRE(ext_mem_w_en, 1)
   `IOB_WIRE(ext_mem_w_data, 9)
   `IOB_WIRE(ext_mem_w_addr, FIFO_DEPTH_LOG2)
   `IOB_WIRE(ext_mem_r_en, 1)
   `IOB_WIRE(ext_mem_r_data, 9)
   `IOB_WIRE(ext_mem_r_addr, FIFO_DEPTH_LOG2)
  
   iob_fifo_sync
     #(
       .W_DATA_W (9),
       .R_DATA_W (9),
       .ADDR_W (FIFO_DEPTH_LOG2)
       )
   fifo
     (
      .arst            (rst),
      .rst             (1'd0),
      .clk             (clk),
      .ext_mem_w_en    (ext_mem_w_en),                                                                                                                                                                                                                                  
      .ext_mem_w_data  (ext_mem_w_data),
      .ext_mem_w_addr  (ext_mem_w_addr),
      .ext_mem_r_en    (ext_mem_r_en),
      .ext_mem_r_addr  (ext_mem_r_addr),
      .ext_mem_r_data  (ext_mem_r_data),
      //read port
      .r_en            (tready),
      .r_data          ({tlast,tdata}), //TLAST signal stored in msb
      .r_empty         (fifo_empty),
      //write port
      .w_en            (valid & |wstrb & (address == `AXISTREAMOUT_IN_ADDR)),
      .w_data          (wdata[8:0]), //Could use AXISTREAMOUT_IN here instead, but would need to delay 'w_en' by one clock
      .w_full          (AXISTREAMOUT_FULL),
      .level           ()
      );
  
   `IOB_REG(clk, tvalid_tmp, (tvalid_tmp & ~tready) | (~fifo_empty & tready))
   `IOB_VAR2WIRE(tvalid_tmp, tvalid)

   //FIFO RAM
   iob_ram_2p #(
      .DATA_W (9),
      .ADDR_W (FIFO_DEPTH_LOG2)
    )
   fifo_memory
   (
      .clk      (clk),
      .w_en     (ext_mem_w_en),
      .w_data   (ext_mem_w_data),
      .w_addr   (ext_mem_w_addr),
      .r_en     (ext_mem_r_en),
      .r_data   (ext_mem_r_data),
      .r_addr   (ext_mem_r_addr)
   );
   
endmodule


