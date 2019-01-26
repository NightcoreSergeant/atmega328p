.org 0x0
rjmp RESET

.org OVF2addr
jmp overflow2

.org 0x34

RESET:
	sbi ddrb,5
	sbi portb,5

lds r16,PRR ;all kind of power save
ori r16,0b10101111
sts PRR,r16

in r16,0x5
lds r16, TIMSK2 ;enable timer2
ori r16,1<<TOIE2
sts TIMSK2,r16

lds r16, TCCR2B ;prescaler
andi r16,0b11111000
ori r16,0b00000111
sts TCCR2B,r16

lds r16,MCUCR ;disable BOD
ori r16,0b01000000
sts MCUCR,r16


lds r16,0x53 ;sleep mode
andi r16,0b11110000
ori r16,0b00000111
sts 0x53,r16

sei
ldi r29,0x54
ldi r30,0xff
ldi r31,0xff ;calculations for a day


main:
	sei
	nop
	sleep
	rjmp main

overflow2:
	cli
	dec r31
	cpi r31,0x0    ;weiting for 4sec
	brne weit
	
	ldi r31,0xff
	
	dec r30
	cpi r30,0x0 ;weiting for half an hour
	brne weit
	
	ldi r30,0xff

	dec r29
	cpi r29,0x0 ;waiting whole day
	brne weit

	ldi r29,0x54


	in r16,0x5 
	cpi r16,0b0
	breq open
	rjmp close 


weit:
	reti

open:
	sbi portb,5
	reti

close:
   cbi portb,5
   reti
