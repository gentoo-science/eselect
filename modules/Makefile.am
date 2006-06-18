safe_scripts = \
		 bashcomp.eselect \
		 binutils.eselect \
		 env.eselect \
		 kernel.eselect \
		 mailer.eselect \
		 profile.eselect \
		 rc.eselect

dodgy_scripts = \
		 config.eselect \
		 cow.eselect \
		 vi.eselect

EXTRA_DIST = $(safe_scripts) $(dodgy_scripts)

MAINTAINERCLEANFILES = Makefile.in

install-data-local : $(safe_scripts) $(dodgy_scripts)
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
	$(INSTALL_DATA) $(safe_scripts) \
		$(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
	if ! test x$(DODGY_MODULES) = "x" ; then \
		$(INSTALL_DATA) $(dodgy_scripts) \
			$(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/ ; \
	fi



