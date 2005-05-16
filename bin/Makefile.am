bin_SCRIPTS = eclectic
EXTRA_DIST = eclectic.in

symlinks = kernel-config profile-config rc-config

dosed = @SED@ -e 's,%DATADIR%,$(datadir),g' \
	      -e 's,%VERSION%,$(VERSION),g'

% : %.in
	@echo "Building $@..."
	@$(dosed) $< > $@
	@if test $@ = $(bin_SCRIPTS) ; then \
		chmod +x $@ ; \
	fi

MAINTAINERCLEANFILES = Makefile.in

install-data-local : $(foreach f, $(symlinks), install-symlink-$(f))

install-symlink-% :
	ln -snf $(DESTDIR)$(bindir)/eclectic \
		$(DESTDIR)$(bindir)/$*

CLEANFILES = $(bin_SCRIPTS)
