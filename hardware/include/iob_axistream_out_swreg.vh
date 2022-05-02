//START_SWREG_TABLE axistream_out 
`IOB_SWREG_W(AXISTREAMOUT_IN, 9, 0) //Set next FIFO input, most significant bit is the TLAST signal (identifies if this byte is the last of the frame)
`IOB_SWREG_R(AXISTREAMOUT_FULL, 1, 0) //Return if FIFO is full
