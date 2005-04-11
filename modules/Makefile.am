noinst_SCRIPTS = bashcomp.eclectic \
                 blas.eclectic \
                 cow.eclectic \
		 kernel-symlink.eclectic \
		 profile-symlink.eclectic \
		 vi-symlink.eclectic

EXTRA_DIST = $(noinst_SCRIPTS)

MAINTAINERCLEANFILES = Makefile.in

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
	$(INSTALL_DATA) $(noinst_SCRIPTS) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
