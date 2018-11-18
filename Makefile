#
# Makefile for local scripts
#

APPS := switcher swstopstart swupdater

all : $(APPS)

	@echo " "
	@echo " Install with "
	@echo "      sudo make install"
	@echo ""

switcher :

INSTALLDIR := /usr/local
SSERVICEDIR := /lib/systemd/system

INSTALL=install

.PHONY: install
install : $(APPS)

	$(INSTALL) switcher $(INSTALLDIR)/sbin
	$(INSTALL) swstopstart $(INSTALLDIR)/sbin
	$(INSTALL) swupdater $(INSTALLDIR)/sbin
#	$(INSTALL) -m 644 switcher.service $(SSERVICEDIR)
#	$(INSTALL) switcher.initd /etc/init.d/switcher
#	systemctl daemon-reload


.PHONY: clean
clean :
	git fetch --force && git reset --hard origin/master


depend : $(wildcard *.c)
	makedepend -f $(lastword $(MAKEFILE_LIST)) -- $(CFLAGS) -- $^


#
# The following is updated by "make depend"
#
# DO NOT DELETE
