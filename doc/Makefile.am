doc_files = developer-guide user-guide release-guide

noinst_DATA = $(foreach f, $(doc_files), $(f).txt)

html: $(foreach f, $(doc_files), $(f).html )

%.html : %.txt
	@RST2HTML@ < $? > $@

CLEANFILES = $(foreach f, $(doc_files), $(f).html)
MAINTAINERCLEANFILES = Makefile.in
EXTRA_DIST = default.css $(noinst_DATA)
