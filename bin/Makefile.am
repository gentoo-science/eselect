bin_SCRIPTS = eclectic
EXTRA_DIST = eclectic.in

dosed = @SED@ -e 's,%DATADIR%,$(datadir),g'

% : %.in
	@echo "Building $@..."
	@$(dosed) $< > $@
	@if test $@ = $(bin_SCRIPTS) ; then \
		chmod +x $@ ; \
	fi

MAINTAINERCLEANFILES = Makefile.in

CLEANFILES = $(bin_SCRIPTS)
