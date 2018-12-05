#
# Makefile for local scripts
#

APPS := switcher swstopstart swupdater swgitstatus
INSTALLDIR := /usr/local
SSERVICEDIR := /lib/systemd/system
INSTALL := install

all : $(APPS)

	@echo " "
	@echo " Install with "
	@echo "      sudo make install"
	@echo ""




.PHONY: install
install : $(APPS)

	$(INSTALL) switcher $(INSTALLDIR)/sbin
	$(INSTALL) swstopstart $(INSTALLDIR)/sbin
	$(INSTALL) swupdater $(INSTALLDIR)/sbin
	$(INSTALL) swgitstatus $(INSTALLDIR)/sbin
	$(INSTALL) loadNextion $(INSTALLDIR)/sbin
	$(INSTALL) loadNextiond $(INSTALLDIR)/sbin


.PHONY: clean
clean :
	git fetch --force && git reset --hard origin/master


depend : $(wildcard *.c)
	makedepend -f $(lastword $(MAKEFILE_LIST)) -- $(CFLAGS) -- $^


#
# The following is updated by "make depend"
#
# DO NOT DELETE
