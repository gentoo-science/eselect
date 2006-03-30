noinst_SCRIPTS = \
		 config.bash \
		 core.bash \
		 default.eselect \
		 manip.bash \
		 multilib.bash \
		 output.bash \
		 path-manipulation.bash \
		 portage.bash \
		 tests.bash

EXTRA_DIST = $(foreach f, $(noinst_SCRIPTS), $(f).in)

dosed = @SED@ -e 's,\@SED\@,@SED@,g' -e 's,\@PORTAGEQ\@,@PORTAGEQ@,g' -e 's,\@CANONICALISE\@,@CANONICALISE@,g'

%.bash : %.bash.in
	@$(dosed) $< > $@

%.eselect : %.eselect.in
	cp $? $@

MAINTAINERCLEANFILES = Makefile.in

CLEANFILES = $(noinst_SCRIPTS)

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/libs/
	$(INSTALL_DATA) $(noinst_SCRIPTS) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/libs/
