# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dwm.c util.c
OBJ = ${SRC:.c=.o}

all: options dwm

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

dwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f dwm ${OBJ}

uninstall:
	rm -f /usr/bin/dwm

install: all
	chmod 755 dwm
	mv dwm /usr/bin/dwm
	
local: all
	chmod 755 dwm

link: all
	chmod 755 dwm
	ln -sf dwm /usr/bin/dwm

.PHONY: all options clean install uninstall
