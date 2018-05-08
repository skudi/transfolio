VERSION := 1.0

transfolio: transfolio.c
	cc -DPPDEV=\"/dev/parport0\" -O3 transfolio.c -o $@
	strip transfolio

rpfolio: transfolio.c
	cc -DRASPIWIRING -IwiringPi -lwiringPi -O3 transfolio.c -o $@
	strip $@

transfolio.exe: transfolio.c
	wine ~/bin/win/dm/bin/dmc.exe -r transfolio.c

dist: transfolio transfolio.exe
	mkdir transfolio-$(VERSION)
	cp transfolio.c transfolio.exe transfolio inpout32.dll Makefile README transfolio-$(VERSION)
	rm transfolio.zip
	zip -r transfolio.zip transfolio-$(VERSION)
