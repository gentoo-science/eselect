bin_SCRIPTS = eselect
EXTRA_DIST = eselect.in

dosed = @SED@ -e 's,\@BASH\@,$(BASH),g' \
	      -e 's,\@DATADIR\@,$(datadir),g' \
	      -e 's,\@EPREFIX\@,$(EPREFIX),g' \
	      -e 's,\@VERSION\@,$(VERSION)$(EXTRAVERSION),g'

% : %.in
	@echo "Building $@..."
	@$(dosed) $< > $@
	@if test $@ = $(bin_SCRIPTS) ; then \
		chmod +x $@ ; \
	fi

MAINTAINERCLEANFILES = Makefile.in

install-data-local : $(foreach f, $(symlinks), install-symlink-$(f))

install-symlink-% : install-binSCRIPTS
	ln -snf eselect $(DESTDIR)$(bindir)/$*

CLEANFILES = $(bin_SCRIPTS)
