//START_SWREG_TABLE axistream_out 
`IOB_SWREG_W(AXISTREAMOUT_NEXT, 1, 0) //Go to next FIFO output
`IOB_SWREG_R(AXISTREAMOUT_OUT, 8, 0) //Get FIFO output
`IOB_SWREG_R(AXISTREAMOUT_TLAST, 1, 0) //Current FIFO output is last from stream
`IOB_SWREG_R(AXISTREAMOUT_EMPTY, 1, 0) //Return if FIFO is empty
