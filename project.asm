ldi r16,0b00000110 ;value for sleep mode...last bit unclear
out 0x33,r16;address to SMCR-sleep mode control register 0x33(0x55)
ldi r17,0b00000101 ;value for prescale clock (clk/1024)
