noinst_SCRIPTS = \
		 config.bash \
		 core.bash \
		 default.eclectic \
		 multilib.bash \
		 output.bash \
		 tests.bash

EXTRA_DIST = $(foreach f, $(noinst_SCRIPTS), $(f).in)

%.bash : %.bash.in
	cp $? $@

%.eclectic : %.eclectic.in
	cp $? $@

MAINTAINERCLEANFILES = Makefile.in

CLEANFILES = $(noinst_SCRIPTS)

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/libs/
	$(INSTALL_DATA) $(noinst_SCRIPTS) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/libs/
