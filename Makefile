obj-m := intelfreq.o
KVERSION = $(shell uname -r)
DESTDIR = $(HOME)

all:	corefreqd
	make -C /lib/modules/$(KVERSION)/build M=${PWD} modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=${PWD} clean
	rm corefreqd

corefreqd:	corefreqd.o
	cc -lpthread -o corefreqd corefreqd.c
corefreqd.o:	corefreqd.c
	cc -c corefreqd.c -o corefreqd.o