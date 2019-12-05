# Top-level Unix makefile for the PINGLIB package
# Should work for all Unix versions
#
OFLAGS = -O0 -g
OFLAGS  = -O2
CFLAGS  = -fPIC -Wall -Wno-format-truncation $(OFLAGS)
#-std=gnu99 
SHELL = /bin/sh
TAR = tar
INSTALL = install

PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
INCDIR = $(PREFIX)/include
LIBDIR = $(PREFIX)/lib
MANDIR = $(PREFIX)/share/man

# No user-serviceable parts below this line

VERSION:=$(shell ./getversion)
LIBMAJOR=1
LIBMINOR=0
LIBPOINT=0
LIBVER=$(LIBMAJOR).$(LIBMINOR).$(LIBPOINT)

SOURCES = pingPlugin.cpp
HEADERS = pingPlugin.h pingPlugin_lib.h
OBJECTS = $(SOURCES:.cpp=.o)

# Some utilities are installed
INSTALLABLE = \
	pingPlugin

# Some utilities are only used internally for testing.
# There is a parallel list in doc/Makefile.
# These are all candidates for removal in future releases.
UTILS = $(INSTALLABLE) \
	pingPlugin

LDLIBS=libpingPlugin.a -lm

all: libpingPlugin.so libpingPlugin.a $(UTILS)
	#$(MAKE) 
	#-C doc

$(UTILS):: libpingPlugin.a

libpingPlugin.so: $(OBJECTS) $(HEADERS)
	$(CC) $(CFLAGS) -dynamiclib -current_version $(LIBVER) $(OBJECTS) -o libpingPlugin.$(LIBMAJOR).dylib
libpingPlugin.a: $(OBJECTS) $(HEADERS)
	$(AR) rcs libpingPlugin.a $(OBJECTS)

clean:
	rm -f $(UTILS) $(TARGET) libpingPlugin.a libpingPlugin.so *.o
	rm -f libpingPlugin.so.$(LIBMAJOR).$(LIBMINOR).$(LIBPOINT)
	rm -f libpingPlugin.so.$(LIBMAJOR)
	rm -fr doc/*.1 *.html doc/staging

check: all
	$(MAKE) -C tests

# Installation/uninstallation

install: all install-bin install-include install-lib install-man
install-bin: $(INSTALLABLE)
	$(INSTALL) -d "$(DESTDIR)$(BINDIR)"
	$(INSTALL) $^ "$(DESTDIR)$(BINDIR)"
install-include:
	$(INSTALL) -d "$(DESTDIR)$(INCDIR)"
	$(INSTALL) -m 644 ping_lib.h "$(DESTDIR)$(INCDIR)"
install-lib:
	$(INSTALL) -d "$(DESTDIR)$(LIBDIR)"
	$(INSTALL) -m 644 libpingPlugin.a "$(DESTDIR)$(LIBDIR)/libpingPlugin.a"
	$(INSTALL) -m 755 libpingPlugin.so "$(DESTDIR)$(LIBDIR)/libpingPlugin.so.$(LIBVER)"
	ln -sf libpingPlugin.so.$(LIBVER) "$(DESTDIR)$(LIBDIR)/libpingPlugin.so.$(LIBMAJOR)"
	ln -sf libpingPlugin.so.$(LIBMAJOR) "$(DESTDIR)$(LIBDIR)/libpingPlugin.so"
install-man:
	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1"
	$(INSTALL) -m 644 doc/*.1 "$(DESTDIR)$(MANDIR)/man1"
uninstall: uninstall-man uninstall-include uninstall-lib uninstall-bin
uninstall-bin:
	cd "$(DESTDIR)$(BINDIR)" && rm -f $(INSTALLABLE)
uninstall-include:
	rm -f "$(DESTDIR)$(INCDIR)/pingPlugin_lib.h"
uninstall-lib:
	cd "$(DESTDIR)$(LIBDIR)" && \
		rm -f libpingPlugin.a libpingPlugin.so libpingPlugin.so.$(LIBMAJOR) libpingPlugin.so.$(LIBVER)
uninstall-man:
	cd "$(DESTDIR)$(MANDIR)/man1" && rm -f $(shell cd doc >/dev/null && echo *.1)

# Make distribution tarball
#
# We include all of the XML, and also generated manual pages
# so people working from the distribution tarball won't need xmlto.

EXTRAS =     README

DSOURCES = Makefile *.[ch]
DOCS = doc/*.xml doc/*.1 doc/*.html doc/index.html.in doc/00README doc/Makefile
ALL =  $(DSOURCES) $(DOCS) tests pic $(EXTRAS)
pingPluginlib-$(VERSION).tar.gz: $(ALL)
	$(TAR) --transform='s:^:pingPluginlib-$(VERSION)/:' -czf pingPluginlib-$(VERSION).tar.gz $(ALL)
pingPluginlib-$(VERSION).tar.bz2: $(ALL)
	$(TAR) --transform='s:^:pingPluginlib-$(VERSION)/:' -cjf pingPluginlib-$(VERSION).tar.bz2 $(ALL)

dist: pingPluginlib-$(VERSION).tar.gz pingPluginlib-$(VERSION).tar.bz2

# Auditing tools.

# Check that getversion hasn't gone pear-shaped.
version:
	@echo $(VERSION)

# cppcheck should run clean
cppcheck:
	cppcheck --inline-suppr --template gcc --enable=all --suppress=unusedFunction --force *.[ch]

# Verify the build
distcheck: all
	$(MAKE) pingPluginlib-$(VERSION).tar.gz
	tar xzvf pingPluginlib-$(VERSION).tar.gz
	$(MAKE) -C pingPluginlib-$(VERSION)
	rm -fr pingPluginlib-$(VERSION)

# release using the shipper tool
release: all distcheck
	$(MAKE) -C doc website
	shipper --no-stale version=$(VERSION) | sh -e -x
	rm -fr doc/staging

# Refresh the website
refresh: all
	$(MAKE) -C doc website
	shipper --no-stale -w version=$(VERSION) | sh -e -x
	rm -fr doc/staging
