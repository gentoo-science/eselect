modulesdir=$(datadir)/$(PACKAGE_NAME)/modules/

safe_scripts = \
		 bashcomp.eselect \
		 binutils.eselect \
		 editor.eselect \
		 env.eselect \
		 kernel.eselect \
		 locale.eselect \
		 modules.eselect \
		 news.eselect \
		 pager.eselect \
		 profile.eselect \
		 rc.eselect \
		 visual.eselect

dodgy_scripts = \
		 config.eselect \
		 cow.eselect

if DODGY_MODULES

modules_DATA=$(safe_scripts) $(dodgy_scripts)

else

modules_DATA=$(safe_scripts)

endif

EXTRA_DIST = $(safe_scripts) $(dodgy_scripts)

MAINTAINERCLEANFILES = Makefile.in
