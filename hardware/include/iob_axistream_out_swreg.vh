//START_SWREG_TABLE axistream_out 
`IOB_SWREG_W(AXISTREAMOUT_NEXT, 1, 0) //Go to next FIFO input
`IOB_SWREG_W(AXISTREAMOUT_IN, 8, 0) //Set FIFO input
`IOB_SWREG_W(AXISTREAMOUT_TLAST, 1, 0) //Set current FIFO input as last from stream
`IOB_SWREG_R(AXISTREAMOUT_FULL, 1, 0) //Return if FIFO is full
