CC=gcc
CFLAGS=-I/usr/include/gtk-3.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include/ -I/usr/include/pango-1.0/ -I/usr/include/cairo/ -I/usr/include/gdk-pixbuf-2.0/  -I/usr/include/atk-1.0/ -I/usr/include/gio-unix-2.0/ -I/usr/include/gtk-vnc-2.0/ -I/usr/include/gvnc-1.0/ -I/usr/include/gvncpulse-1.0/ -I.
LDLIBS=-lgtk-vnc-2.0 -lgtk-3 -lgdk-3 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0 -lgvnc-1.0 -lgio-2.0 -lgvncpulse-1.0
SRCS=src/runovnc.c
OBJS=$(subst .c,.o,$(SRCS))
PREFIX=/usr/local
all: runovnc

runovnc: $(OBJS)
	$(CC) -o bin/runovnc $(OBJS) $(LDLIBS)

runvnc.o: $(SRCS)

install:
	instal -m 755 runovnc $(DESTDIR)/$(PREFIX)/bin

clean:
	rm -f $(OBJS)

distclean: clean
	rm -f bin/runovnc
