noinst_SCRIPTS = cow.eclectic \
		 kernel-symlink.eclectic \
		 vi-symlink.eclectic \
		 bashcomp.eclectic

EXTRA_DIST = $(noinst_SCRIPTS)

MAINTAINERCLEANFILES = Makefile.in

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
	$(INSTALL_DATA) $(noinst_SCRIPTS) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
