safe_scripts = \
		 bashcomp.eselect \
		 blas.eselect \
		 kernel.eselect \
		 lapack.eselect \
		 mailer.eselect \
		 profile.eselect \
		 rc.eselect

dodgy_scripts = \
		 binutils.eselect \
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



