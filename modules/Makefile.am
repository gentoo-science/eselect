noinst_SCRIPTS = cow.eclectic kernel-symlink.eclectic vi-symlink.eclectic
EXTRA_DIST = $(noinst_SCRIPTS)

MAINTAINERCLEANFILES = Makefile.in

install-exec-local:
	$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE_NAME@/modules/
	$(INSTALL_DATA) $(noinst_SCRIPTS) $(datadir)/@PACKAGE_NAME@/modules/
