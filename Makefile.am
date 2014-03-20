AUTOMAKE_OPTIONS = dist-xz no-dist-gzip

doc_files = README TODO
export symlinks := kernel-config profile-config rc-config

SUBDIRS = doc man misc bin libs modules
MAINTAINERCLEANFILES = \
	aclocal.m4 \
	configure \
	Makefile.in \
	*.html

EXTRA_DIST = \
	autogen.bash \
	ChangeLog \
	$(doc_files)

html: $(foreach f, $(doc_files), $(f).html)
	cd doc && $(MAKE) html

%.html: %
	@RST2HTML@ --strip-comments < $? > $@

maintainer-clean-local:
	-rm -rf config
