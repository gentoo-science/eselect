noinst_SCRIPTS = bashcomp.eclectic \
		 blas.eclectic \
		 config.eclectic \
		 kernel.eclectic \
		 lapack.eclectic \
		 mailer.eclectic \
		 profile.eclectic

EXTRA_DIST = $(noinst_SCRIPTS)

MAINTAINERCLEANFILES = Makefile.in

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
	$(INSTALL_DATA) $(noinst_SCRIPTS) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
