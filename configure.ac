AC_INIT(eselect, 1.4.5, eselect@gentoo.org, eselect)
AC_PREREQ(2.59)
AC_CONFIG_SRCDIR(bin/eselect.in)
AC_CONFIG_AUX_DIR(config)
AM_INIT_AUTOMAKE

test x$prefix = xNONE && prefix="$ac_default_prefix"
test x$datadir = xNONE && datadir="$ac_default_datadir"
test x$sysconfdir = xNONE && sysconfdir="$ac_default_sysconfdir"

# BASH may already be set in the shell, if the admin then changes the
# the /bin/sh symlink to a non-bash shell, all hell will break lose.
# thanks to James Rowe for the heads up.
unset BASH
AC_PATH_PROGS(BASH, bash)
if test x$BASH = x; then
    AC_MSG_ERROR([bash is required])
fi

# AC_PROG_SED doesn't work here, because on Gentoo FreeBSD systems it
# is confused by a wrapper script that is in the PATH at build time.
AC_PATH_PROGS(SED, [gsed sed])
if test x$SED = x; then
    AC_MSG_ERROR([sed is required])
fi
AC_MSG_CHECKING([whether $SED is GNU sed])
if $SED 'v4.0' </dev/null >/dev/null 2>&1; then
    AC_MSG_RESULT(yes)
else
    AC_MSG_RESULT(no)
    AC_MSG_ERROR([GNU sed is required])
fi

AC_PATH_PROG(PORTAGEQ, portageq, /usr/bin/portageq,
  [$prefix/bin:/usr/bin:/bin:$PATH])
AC_PATH_PROG(ENV_UPDATE, env-update, /usr/sbin/env-update,
  [$PATH:$prefix/sbin:/usr/sbin])

AC_PATH_PROG(READLINK, greadlink)
if test x$READLINK = x; then
    AC_PATH_PROG(READLINK, readlink)
    if test x$READLINK != x; then
        AC_MSG_CHECKING([whether readlink supports -f])
        if $READLINK -f . >/dev/null 2>&1; then
            AC_MSG_RESULT(yes)
        else
            AC_MSG_RESULT(no)
            READLINK=""
        fi
    fi
    if test x$READLINK = x; then
        AC_PATH_PROG(REALPATH, realpath)
    fi
fi
if test x$READLINK != x; then
    CANONICALISE="$READLINK -f"
elif test x$REALPATH != x; then
    CANONICALISE="$REALPATH"
else
    AC_MSG_ERROR([Either GNU readlink or realpath is required])
fi
AC_SUBST(CANONICALISE)

# Gentoo uses rst2html.py but most other
# distros install it w/o the .py extension
AC_PATH_PROGS(RST2HTML, [rst2html rst2html.py])

# Support for Gentoo Prefix
AC_MSG_CHECKING([if target installation is in an offset prefix])
EPREFIX=""
AS_CASE([$prefix],
  [/usr], [],
  [*/usr], [EPREFIX=`echo "$prefix" | sed 's:/usr$::'`])
AC_MSG_RESULT([${EPREFIX:-nope}])
AC_SUBST(EPREFIX)

# Include extra version information when building from git
AC_MSG_CHECKING([whether building from git])
EXTRAVERSION=""
if test -d ${GIT_DIR:-.git}; then
    COMMIT=`git describe --long --always HEAD`
    if test x$COMMIT != x; then
        EXTRAVERSION=", git commit $COMMIT"
    fi
    AC_MSG_RESULT([yes${COMMIT:+, at commit $COMMIT}])
else
    AC_MSG_RESULT(no)
fi
AC_SUBST(EXTRAVERSION)

AC_CONFIG_FILES(Makefile
		doc/Makefile
		man/Makefile
		misc/Makefile
		bin/Makefile
		libs/Makefile
		modules/Makefile)
AC_OUTPUT
