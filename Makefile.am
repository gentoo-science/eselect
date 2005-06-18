# $Id: Makefile.am 79 2004-12-03 13:56:26Z ka0ttic $

AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip

doc_files = README TODO

SUBDIRS = doc man misc bin libs modules
MAINTAINERCLEANFILES = aclocal.m4 \
		       configure \
		       Makefile.in \
		       config/config.guess \
		       config/ltmain.sh \
		       config/config.sub \
		       *.html

EXTRA_DIST = autogen.sh \
	     ChangeLog \
	     $(doc_files)

html: $(foreach f, $(doc_files), $(f).html)
	cd doc && $(MAKE) html

%.html: %
	rst2html.py < $? > $@
