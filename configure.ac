AC_INIT(eselect, 1.2.4, eselect@gentoo.org, eselect)
AC_PREREQ(2.59)
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

ES_PROG_GNU_SED
if test x$SED = "x" ; then
    AC_MSG_ERROR([GNU sed is required])
fi

AC_PATH_PROG(PORTAGEQ, portageq, /usr/bin/portageq)

AC_PATH_PROG(READLINK, greadlink)
if test x$READLINK = "x" ; then
    AC_CHECK_PROG(READLINK, readlink -f ., yes, no, [$PATH])
    if test x$READLINK = "xyes" ; then
        AC_PATH_PROG(READLINK, readlink)
    fi

    CANONICALISE_TEST=`$READLINK -f . > /dev/null 2>&1`
    if ! test x$? = "x0" ; then
        unset READLINK
    fi

    if test x$READLINK = "x" ; then
        AC_PATH_PROG(REALPATH, realpath)
        if test x$REALPATH = "x" ; then
            AC_MSG_ERROR([Either GNU readlink or realpath is required])
        fi
    fi
fi
if test x$READLINK != "x"; then
    CANONICALISE="$READLINK -f"
else
    CANONICALISE="$REALPATH"
fi
AC_SUBST(CANONICALISE)

# Gentoo uses rst2html.py but most other
# distro's/OS's install it w/o the .py extension
AC_PATH_PROG(RST2HTML, rst2html)
if test x$RST2HTML = "x" ; then
    AC_PATH_PROG(RST2HTML, rst2html.py)
fi

AC_MSG_CHECKING([what package manager we shall use])
AC_ARG_WITH(pm, [AS_HELP_STRING([--with-pm=PM], [use package manager PM])],
  [], [withval=portage])
AS_CASE([x$withval], xportage,, xpaludis,,
  [AC_MSG_ERROR([package manager "$withval" not known])])
AC_SUBST(PACKAGE_MANAGER, [$withval])
AC_MSG_RESULT([$PACKAGE_MANAGER])

# Support for Gentoo Alt/Prefix
AC_MSG_CHECKING([if target installation is in an offset prefix])
EPREFIX=""
AS_CASE([$prefix],
  [/usr], [],
  [*/usr], [EPREFIX=`echo "$prefix" | sed 's:/usr$::'`])
AC_MSG_RESULT([${EPREFIX:-nope}])
AC_SUBST(EPREFIX)

AC_MSG_CHECKING([whether dodgy modules should be installed])
AC_ARG_ENABLE(dodgy_modules,
  [AS_HELP_STRING([--enable-dodgy-modules],
    [enable experimental and incomplete modules])]
  if test x$enableval = "xyes" ; then
      DODGY_MODULES="yes"
  else
      DODGY_MODULES="no"
  fi)
AC_SUBST(DODGY_MODULES)
AC_MSG_RESULT(${DODGY_MODULES:-nope})
AM_CONDITIONAL([DODGY_MODULES], test "x$DODGY_MODULES" = "xyes")

AC_OUTPUT(Makefile
	  doc/Makefile
	  man/Makefile
	  misc/Makefile
	  bin/Makefile
	  libs/Makefile
	  modules/Makefile)
