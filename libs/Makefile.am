eselectlibsdir = $(datadir)/$(PACKAGE_NAME)/libs/

eselectlibs_DATA = 
	alternatives.bash \
	alternatives-common.bash \
	config.bash \
	core.bash \
	default.eselect \
	editor-variable.bash \
	manip.bash \
	multilib.bash \
	output.bash \
	package-manager.bash \
	path-manipulation.bash \
	skel.bash \
	tests.bash

EXTRA_DIST = \
	alternatives.bash.in \
	alternatives-common.bash.in \
	config.bash.in \
	core.bash.in \
	default.eselect.in \
	editor-variable.bash.in \
	manip.bash.in \
	multilib.bash.in \
	output.bash.in \
	package-manager.bash.in \
	path-manipulation.bash.in \
	skel.bash.in \
	tests.bash.in

dosed = @SED@ \
	-e 's%\@SED\@%@SED@%g' \
	-e 's%\@PORTAGEQ\@%@PORTAGEQ@%g' \
	-e 's%\@ENV_UPDATE\@%@ENV_UPDATE@%g' \
	-e 's%\@CANONICALISE\@%@CANONICALISE@%g' \
	-e 's%\@sysconfdir\@%@sysconfdir@%g'

%.bash : %.bash.in
	@$(dosed) $< > $@

%.eselect : %.eselect.in
	cp $? $@

MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = $(eselectlibs_DATA)
