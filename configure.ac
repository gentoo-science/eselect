AC_INIT(eclectic, 0.9.2, ciaranm@gentoo.org, eclectic)
AC_PREREQ(2.53)
AC_CONFIG_SRCDIR(bin/eclectic.in)
AC_CONFIG_AUX_DIR(config)
AM_INIT_AUTOMAKE(1.9)

test x$prefix = "xNONE" && prefix="$ac_default_prefix"
test x$datadir = "xNONE" && datadir="$ac_default_datadir"
test x$sysconfdir = "xNONE" && sysconfdir="$ac_default_sysconfdir"

# BASH may already be set in the shell, if the admin then changes the
# the /bin/sh symlink to a non-bash shell, all hell will break lose.
# thanks to James Rowe for the heads up.
unset BASH
AC_PATH_PROGS(BASH, bash)
if test x$BASH = "x"; then
    AC_MSG_ERROR([bash is required])
fi

AC_CHECK_PROGS(SED, sed)
if test x$SED = "x"; then
    AC_MSG_ERROR([sed is required])
fi

AC_OUTPUT(Makefile
	  doc/Makefile
	  man/Makefile
	  misc/Makefile
	  bin/Makefile
	  libs/Makefile
	  modules/Makefile)

