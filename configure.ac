AC_INIT(eselect, 1.0_rc1, eselect@gentoo.org, eselect)
AC_PREREQ(2.53)
AC_CONFIG_SRCDIR(bin/eselect.in)
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
if test x$BASH = "x" ; then
    AC_MSG_ERROR([bash is required])
fi

unset SED
ES_PROG_GNU_SED
if test x$SED = "x" ; then
    AC_MSG_ERROR([GNU sed is required])
fi

unset PORTAGEQ
AC_PATH_PROG(PORTAGEQ, portageq)
if test x$PORTAGEQ = "x" ; then
    AC_MSG_ERROR([Portage is required])
fi
AC_SUBST(PORTAGEQ)

AC_MSG_CHECKING([whether dodgy modules should be installed])
AC_ARG_ENABLE(dodgy_modules,
  [  --enable-dodgy-modules  Enable experimental and incomplete modules],
  if test x$enableval = "xyes" ; then
      DODGY_MODULES="yes"
  else
      DODGY_MODULES="no"
  fi)
AC_SUBST(DODGY_MODULES)
AC_MSG_RESULT(${DODGY_MODULES:-nope})

AC_OUTPUT(Makefile
	  doc/Makefile
	  man/Makefile
	  misc/Makefile
	  bin/Makefile
	  libs/Makefile
	  modules/Makefile)

