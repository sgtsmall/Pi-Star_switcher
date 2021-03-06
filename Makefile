#
# Makefile for local scripts
#

APPS := switcher swstopstart swupdater swgitstatus swupdateuser loadNextion loadNextiond swupdateuser getNextion setNextion swupdatetg
UDATFILE := UserGroup/groups.txt UserGroup/stripped.csv
DATFILE := configs/MMDVM.conflist configs/Switcher.tft
PREFIX := /usr/local
SSERVICEDIR := /lib/systemd/system
INSTALL := install
MKDIR_P := mkdir -p
DATADIR := /home/pi-star/configs

all : $(APPS)

	@echo " "
	@echo " Install with "
	@echo "      sudo make install"
	@echo "	 sudo make install-list"
	@echo "	 sudo make install-user"
	@echo "   then run swupdateuser to get latest list"




.PHONY: install
install : $(APPS)

	$(INSTALL) $^ $(PREFIX)/sbin

.PHONY: install-list
install-list : $(DATFILE)
	$(MKDIR_P) $(DATADIR)
	$(INSTALL) $^ $(DATADIR)/


.PHONY: install-user
install-user : $(UDATFILE)
	$(INSTALL) $^ $(PREFIX)/etc



.PHONY: clean
clean :
	git fetch --force && git reset --hard origin/master

.PHONY: clean-all
clean-all :
	rm -r $(DATADIR)

depend : $(wildcard *.c)
	makedepend -f $(lastword $(MAKEFILE_LIST)) -- $(CFLAGS) -- $^


#
# The following is updated by "make depend"
#
# DO NOT DELETE
