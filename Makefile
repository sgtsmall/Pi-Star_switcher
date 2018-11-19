#
# Makefile for local scripts
#

APPS := switcher swstopstart swupdater swgitstatus

all : $(APPS)

	@echo " "
	@echo " Install with "
	@echo "      sudo make install"
	@echo ""

switcher :

INSTALLDIR := /usr/local
SSERVICEDIR := /lib/systemd/system
INSTALL=install

swgitstatus :

INSTALLDIR := /usr/local
SSERVICEDIR := /lib/systemd/system
INSTALL=install

.PHONY: install
install : $(APPS)

	$(INSTALL) $< $(INSTALLDIR)/sbin


.PHONY: clean
clean :
	git fetch --force && git reset --hard origin/master


depend : $(wildcard *.c)
	makedepend -f $(lastword $(MAKEFILE_LIST)) -- $(CFLAGS) -- $^


#
# The following is updated by "make depend"
#
# DO NOT DELETE
