eselectlibsdir = $(datadir)/$(PACKAGE_NAME)/libs/

eselectlibs_SCRIPTS = \
		      config.bash \
		      core.bash \
		      default.eselect \
		      editor-variable.eselect \
		      manip.bash \
		      multilib.bash \
		      output.bash \
		      package-manager.bash \
		      paludis.bash \
		      path-manipulation.bash \
		      portage.bash \
		      skel.bash \
		      tests.bash

EXTRA_DIST = \
	     config.bash.in \
	     core.bash.in \
	     default.eselect.in \
	     editor-variable.eselect.in \
	     manip.bash.in \
	     multilib.bash.in \
	     output.bash.in \
	     package-manager.bash.in \
	     paludis.bash.in \
	     path-manipulation.bash.in \
	     portage.bash.in \
	     skel.bash.in \
	     tests.bash.in

dosed = @SED@ \
	-e 's,\@SED\@,@SED@,g' \
	-e 's,\@PALUDIS\@,@PALUDIS@,g' \
	-e 's,\@PORTAGEQ\@,@PORTAGEQ@,g' \
	-e 's,\@CANONICALISE\@,@CANONICALISE@,g'

%.bash : %.bash.in
	@$(dosed) $< > $@

%.eselect : %.eselect.in
	cp $? $@

MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = $(eselectlibs_SCRIPTS)
