man_MANS = \
	eselect.1 \
	binutils.eselect.5 \
	editor.eselect.5 \
	env.eselect.5 \
	kernel.eselect.5 \
	news.eselect.5 \
	pager.eselect.5 \
	profile.eselect.5 \
	rc.eselect.5 \
	visual.eselect.5

EXTRA_DIST = $(man_MANS)
MAINTAINERCLEANFILES = Makefile.in

# turn foo-<suffix> into foo.eselect.5
dosed = @SED@ -e 's%^\(.*\)-.*%\1\.eselect\.5%'

install-data-local : $(foreach f, $(symlinks), install-symlink-$(f))

install-symlink-% : install-man
	ln -snf \
		../man5/$(shell echo $* | $(dosed)) \
		$(DESTDIR)$(mandir)/man1/$*.1
