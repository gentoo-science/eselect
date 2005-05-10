#!/bin/sh

dothis() {
    echo "$*"
    if ! $* ;then
        echo "Oops! Something's wrong."
        exit 1
    fi
}

#libtoolize --copy --force --automake
rm -f config.cache
mkdir -p config
export WANT_AUTOMAKE=1.9
export WANT_AUTOCONF=2.5
dothis aclocal -I . ${ACLOCAL_FLAGS}
#dothis autoheader
dothis autoconf
dothis automake -a

echo "Success. Next, run ./configure --help"

