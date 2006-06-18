man_MANS = eselect.1 \
	   bashcomp.eselect.5 \
	   binutils.eselect.5 \
	   env.eselect.5 \
	   profile.eselect.5 \
	   mailer.eselect.5 \
	   rc.eselect.5 \
	   kernel.eselect.5

EXTRA_DIST = $(man_MANS)
MAINTAINERCLEANFILES = Makefile.in

# turn foo-<suffix> into foo.eselect.5
dosed = @SED@ -e 's,^\(.*\)-.*,\1\.eselect\.5,'

install-data-local : install-man $(foreach f, $(symlinks), install-symlink-$(f))

install-symlink-% :
	ln -snf \
		$(DESTDIR)$(mandir)/man5/$(shell echo $* | $(dosed)) \
		$(DESTDIR)$(mandir)/man1/$*.1
