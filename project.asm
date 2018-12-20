;0x2932e0 number of cicles
ldi r16,0b00000110 ;value for sleep mode...last bit unclear
out 0x33,r16;address to SMCR-sleep mode control register 0x33(0x55)
ldi r17,0b000001000 ;value for prescale clock (clk/1024)
sts 0x61, r17 ;address to CLKPR – Clock Prescale Register
