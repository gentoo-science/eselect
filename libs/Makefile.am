noinst_SCRIPTS = core.bash default.eclectic output.bash config.bash
EXTRA_DIST = core.bash.in default.eclectic.in output.bash.in config.bash.in

%.bash : %.bash.in
	cp $? $@

%.eclectic : %.eclectic.in
	cp $? $@

MAINTAINERCLEANFILES = Makefile.in

CLEANFILES = $(noinst_SCRIPTS)

install-exec-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/libs/
	$(INSTALL_DATA) $(noinst_SCRIPTS) $(datadir)/@PACKAGE_NAME@/libs/
