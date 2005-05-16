safe_scripts = \
		 bashcomp.eclectic \
		 blas.eclectic \
		 kernel.eclectic \
		 lapack.eclectic \
		 mailer.eclectic \
		 profile.eclectic \
		 rc.eclectic

dodgy_scripts = \
		 config.eclectic \
		 cow.eclectic \
		 vi.eclectic

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



