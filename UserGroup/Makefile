# Slightly modified from md380tools version
include ../curl.mak


INSTALLDIR := /usr/local
INSTALL := install
ICONV=iconv -c -f UTF-8 -t ascii//TRANSLIT



.PHONY: all update clean install

#all: stripped.csv repeaters.csv users.json repeaters.json
all: stripped.csv

clean:
	rm -f repeaters.csv users.json repeaters.json special_IDs.csv *.tmp stripped.csv

update:
	"${MAKE}" clean
	"${MAKE}" stripped.csv
	sudo "${MAKE}" install

#This strips out all unicode characters.
#We'd rather just drop the accents.

custom.csv: groups.txt
	awk -F: -f groupcustom.awk $^ > $@

#stripped.csv: custom.csv special.tmp fixed.csv dmrmarc2.tmp reflector.tmp
stripped.csv: custom.csv reorder.tmp
	awk -F, -f combine.awk $^ | $(ICONV)  | sort -t ',' -k1g,1 | awk 'NR>3' >stripped.csv

reorder.tmp: newuser.tmp
	sed 's/:/,/g' $^ |sed 's/",/":/g'  |awk -F: -f reorder.awk  >$@

newuser.tmp:
	curl  $(CURL_FLAGS) 'https://www.radioid.net/api/dmr/user/?country=%&format=csv' >$@

##dmrmarc2.tmp: dmrmarc.tmp
##	awk -F, -f insert_nick.awk <$< >$@

##dmrmarc.tmp:
##	curl $(CURL_FLAGS) 'http://www.dmr-marc.net/cgi-bin/trbo-database/datadump.cgi?table=users&format=csv&header=0' | perl -pe 's,<br/>,,' >$@

##reflector.tmp:
##	curl $(CURL_FLAGS) 'http://registry.dstar.su/reflector.db' | perl -pe '$$_ = "" if ( $$. == 1 ); s#@#,#; s#@.*#,,,,,,#' >$@

##special.tmp:
##	python2 get_special_IDs.py

##users.json:
##	curl $(CURL_FLAGS) 'http://www.dmr-marc.net/cgi-bin/trbo-database/datadump.cgi?table=users&format=json&header=0' >$@

##repeaters.json:
##	curl $(CURL_FLAGS) 'http://www.dmr-marc.net/cgi-bin/trbo-database/datadump.cgi?table=repeaters&format=json&header=0' >$@

##repeaters.csv:
##	curl $(CURL_FLAGS) 'http://www.dmr-marc.net/cgi-bin/trbo-database/datadump.cgi?table=repeaters&format=csv&header=0' | perl -pe 's,<BR/>,,' >$@

# not used
##bmgroups.json:
##	curl $(CURL_FLAGS) 'https://brandmeister.network/dist/js/bm/groups.js' >$@


ci: clean all


.PHONY: install
install : $(APPS)

	$(INSTALL) groups.txt $(INSTALLDIR)/etc
	$(INSTALL) stripped.csv $(INSTALLDIR)/etc
