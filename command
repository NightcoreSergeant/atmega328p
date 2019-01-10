C:\Program Files (x86)\Arduino\hardware\tools\avr\bin\avrdude.exe
-C"C:\Program Files (x86)\Arduino\hardware\tools\avr/etc/avrdude.conf" -v -patmega328p -carduino -PCOM3 -b115200 -D -Uflash:w:$(TargetDir)$(TargetName).hex:i
