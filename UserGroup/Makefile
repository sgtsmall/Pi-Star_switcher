# Slightly modified from md380tools version
include ../curl.mak


INSTALLDIR := /usr/local
INSTALL := install
ICONV=iconv -c -f UTF-8 -t ascii//TRANSLIT



.PHONY: all update clean install

#all: stripped.csv repeaters.csv users.json repeaters.json
all: stripped.csv TGList_BM.txt groups.txt

clean:
	rm -f repeaters.csv users.json repeaters.json special_IDs.csv *.tmp stripped.csv TGList_BM.txt groups.txt

update:
	"${MAKE}" clean
	"${MAKE}" stripped.csv
	"${MAKE}" TGList_BM.txt
	"${MAKE}" groups.txt
	sudo "${MAKE}" install

#This strips out all unicode characters.
#We'd rather just drop the accents.

#custom.csv: groups.txt
#	awk -F: -f groupcustom.awk $^ > $@

#stripped.csv: custom.csv special.tmp fixed.csv dmrmarc2.tmp reflector.tmp
stripped.csv: custom.csv reorder.tmp
	awk -F, -f combine.awk $^ | $(ICONV)  | sort -t ',' -k1g,1 | awk 'NR>3' >$@ ; sed -s -i '1i\\' $@

reorder.tmp: newuser.tmp
##	sed 's/:/,/g' $^ |sed 's/",/":/g'  |
	awk -F, -f reorder.awk $^ >$@

newuser.tmp:
	curl  $(CURL_FLAGS) -o $@ "https://www.radioid.net/static/user.csv"

newdmrids.tmp:
	curl  $(CURL_FLAGS) -o $@ "http://www.pistar.uk/downloads/DMRIds.dat"

groups.txt: TGList_BM.txt
	awk -F, -f groupclean.awk $^ >$@

TGList_BM.txt: newtglist.tmp
	swupdatetg -u $^
	( head -n 10 $^ && tail -n +11 $^ | sort -n) > $@
newtglist.tmp:
	curl  $(CURL_FLAGS) -o $@ "http://www.pistar.uk/downloads/TGList_BM.txt"

##	curl  $(CURL_FLAGS) 'https://www.radioid.net/api/dmr/user/?country=%&format=csv' >$@

##dmrmarc2.tmp: dmrmarc.tmp
##	awk -F, -f insert_nick.awk <$< >$@

##dmrmarc.tmp:
##	curl $(CURL_FLAGS) 'http://www.dmr-marc.net/cgi-bin/trbo-database/datadump.cgi?table=users&format=csv&header=0' | perl -pe 's,<br/>,,' >$@

##reflector.tmp:
##	curl $(CURL_FLAGS) 'http://registry.dstar.su/reflector.db' | perl -pe '$$_ = "" if ( $$. == 1 ); s#@#,#; s#@.*#,,,,,,#' >$@

# not used
##bmgroups.json:
##	curl $(CURL_FLAGS) 'https://brandmeister.network/dist/js/bm/groups.js' >$@


ci: clean all


.PHONY: install
install : $(APPS)

	$(INSTALL) groups.txt $(INSTALLDIR)/etc
	$(INSTALL) stripped.csv $(INSTALLDIR)/etc
	$(INSTALL) TGList_BM.txt $(INSTALLDIR)/etc
