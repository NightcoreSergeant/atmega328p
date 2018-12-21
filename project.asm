;0xa4cb80 number of cicles to be made(24h)
;0x0000 addres to RESET vector
.org 0x0
jmp RESET
.org 0x034
RESET:
        ;
        ;
        ;

ldi r16,0b00000111 ;value for sleep mode...last bit enable sleep mode
out 0x33,r16;address to SMCR-sleep mode control register 0x33(0x55)
ldi r17,0b100001000 ;value for prescale clock (clk/256)
sts 0x61, r17 ;address to CLKPR – Clock Prescale Register
ldi r16,
sleep
