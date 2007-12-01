modulesdir=$(datadir)/$(PACKAGE_NAME)/modules/

safe_scripts = \
		 bashcomp.eselect \
		 binutils.eselect \
		 env.eselect \
		 kernel.eselect \
		 mailer.eselect \
		 modules.eselect \
		 profile.eselect \
		 rc.eselect

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
