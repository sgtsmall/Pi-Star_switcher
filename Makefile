#
# Makefile for local scripts
#

APPS := switcher swstopstart swupdater swgitstatus swupdateuser loadNextion loadNextiond swupdateuser
UDATFILE := groups.txt stripped.csv
DATFILE := configs/MMDVM.conflist
PREFIX := /usr/local
SSERVICEDIR := /lib/systemd/system
INSTALL := install
DATADIR := /home/pi-star/configs

all : $(APPS)

	@echo " "
	@echo " Install with "
	@echo "      sudo make install"
	@echo ""




.PHONY: install
install : $(APPS)

	$(INSTALL) $< $(PREFIX)/sbin
#	$(INSTALL) swstopstart $(INSTALLDIR)/sbin
#	$(INSTALL) swupdater $(INSTALLDIR)/sbin
#	$(INSTALL) swupdater $(INSTALLDIR)/sbin
#	$(INSTALL) swgitstatus $(INSTALLDIR)/sbin
#	$(INSTALL) loadNextion $(INSTALLDIR)/sbin
#	$(INSTALL) loadNextiond $(INSTALLDIR)/sbin
#	$(INSTALL) UserGroup/groups.txt $(INSTALLDIR)/etc
#	$(INSTALL) UserGroup/stripped.csv $(INSTALLDIR)/etc
#	$(INSTALL) configs/MMDVM.conflist $(DATADIR)

.PHONY: install-list
install-list : $(DATFILE)
	$(INSTALL) $< $(DATADIR)


.PHONY: clean
clean :
	git fetch --force && git reset --hard origin/master


depend : $(wildcard *.c)
	makedepend -f $(lastword $(MAKEFILE_LIST)) -- $(CFLAGS) -- $^


#
# The following is updated by "make depend"
#
# DO NOT DELETE
