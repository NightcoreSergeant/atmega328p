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

ldi r30,0xff
ldi r31,0x29 ;final


lds r16,0x53 ;sleep mode
andi r16,0b11110000
ori r16,0b00000010
sts 0x53,r16

sei


main:
	sei
	sleep
	rjmp main

prekinitev:
	cli
	dec r30
	cpi r30,0x0
	brne weit1
	
	;dec r31
	;cpi r31,0x0
	;breq weit2
	
	
	ldi r30,0xff
	
	in r16,0x5 
	cpi r16,0b0
	breq prizgi
	rjmp ugasni 


weit1:
	reti

;weit2:
;	rjmp RESET

prizgi:
	sbi portb,5
	reti

ugasni:
;	rjmp RESET
   cbi portb,5
   reti
