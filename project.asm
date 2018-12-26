;0x0000 addres to RESET vector
.org 0x0
jmp RESET
.org 0x001a
jmp TIMER1_OVF
.org 0x034
RESET:
        ;
        ;
        ;
TIMER1_OVF:
        cpi r17,0x0
        breq end_task
        dec r17
        iret

.org 0x100
ldi r16,0b00000111 ;value for sleep mode...last bit enable sleep mode
out 0x33,r16;address to SMCR-sleep mode control register 0x33(0x55)
;system clock;ldi r17,0b100001000 ;value for prescale clock (clk/256)
;sysetm clock;sts 0x61, r17 ;address to CLKPR – Clock Prescale Register

ldi r16,0b0110000 ;value for BOD disable-BODS and BODSE
out 0x35,r16 ;address to MCUCR

ldi r16,0b00000101 ;value for prescale clock(1) (clk/1024)
sts 0x81,r16;address to TC1 Control Register B-TCCR1B

ldi r16,0b00100111 ;value for Timer/Counter 1 Interrupt Mask Register TIMSK1 (enable overflow interrupts and A,B comparison) 
sts 0x6f,r16 ;address to Timer/Counter 1 Interrupt Mask Register

ldi r17,0x29;value to decrese for pretty acurate time (a day)

loop:
        sei
        sleep
        cli
        rjmp loop

end_task:
        cli
        nop
        RESET
