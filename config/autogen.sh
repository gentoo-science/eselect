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
dothis aclocal -I . ${ACLOCAL_FLAGS}
#dothis autoheader
dothis automake -a 
dothis autoconf

echo "Success. Next, run ./configure --help"

