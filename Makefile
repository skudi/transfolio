VERSION := 1.0

transfolio: transfolio.c
	cc -O3 transfolio.c -o transfolio
	strip transfolio

transfolio.exe: transfolio.c
	wine ~/bin/win/dm/bin/dmc.exe -r transfolio.c

dist: transfolio transfolio.exe
	mkdir transfolio-$(VERSION)
	cp transfolio.c transfolio.exe transfolio inpout32.dll Makefile README transfolio-$(VERSION)
	rm transfolio.zip
	zip -r transfolio.zip transfolio-$(VERSION)
