.org 0x0
rjmp RESET

.org OVF2addr
jmp prekinitev

.org 0x34

RESET:
	sbi ddrb,5
	sbi portb,5
in r16,0x5
lds r16, TIMSK2
ori r16,1<<TOIE2
sts TIMSK2,r16

lds r16, TCCR2B
andi r16,0b11111000
ori r16,0b00000111
sts TCCR2B,r16




lds r16,0x53 ;sleep mode
andi r16,0b11110000
ori r16,0b00000111
sts 0x53,r16

sei
ldi r29,0x30
ldi r30,0xff
ldi r31,0xff ;final


main:
	sei
	nop
	sleep
	rjmp main

prekinitev:
	cli
	dec r31
	cpi r31,0x0    ;cakanje na sec
	brne weit
	
	ldi r31,0xff
	
	dec r30
	cpi r30,0x0 ;cakanje na pol ure
	brne weit
	
	ldi r30,0xff

	dec r29
	cpi r29,0x0 ;waiting whole day
	brne weit

	ldi r29,0x30


	in r16,0x5 
	cpi r16,0b0
	breq prizgi
	rjmp ugasni 


weit:
	reti

prizgi:
	sbi portb,5
	reti

ugasni:
;	rjmp RESET
   cbi portb,5
   reti
