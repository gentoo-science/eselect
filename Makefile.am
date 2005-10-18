# $Id: Makefile.am 79 2004-12-03 13:56:26Z ka0ttic $

AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip

doc_files = README TODO
export symlinks := kernel-config profile-config rc-config bashcomp-config

SUBDIRS = doc man misc bin libs modules
MAINTAINERCLEANFILES = aclocal.m4 \
		       configure \
		       Makefile.in \
		       config/config.guess \
		       config/ltmain.sh \
		       config/config.sub \
		       *.html

EXTRA_DIST = autogen.bash \
	     ChangeLog \
	     $(doc_files)

html: $(foreach f, $(doc_files), $(f).html)
	cd doc && $(MAKE) html

%.html: %
	@RST2HTML@ < $? > $@
