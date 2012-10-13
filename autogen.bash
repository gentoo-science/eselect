#!/usr/bin/env bash
# vim: set sw=4 sts=4 et tw=80 :

if test "xyes" = x"${BASH_VERSION}" ; then
    echo "This is not bash!"
    exit 127
fi

trap 'echo "exiting." ; exit 250' 15
KILL_PID=$$

run() {
    echo ">>> $@" 1>&2
    if ! $@ ; then
        echo "oops!" 1>&2
        exit 127
    fi
}

get() {
    local p=${1} v=
    shift

    for v in ${@} ; do
        type ${p}-${v}    &>/dev/null && echo ${p}-${v}    && return
        type ${p}${v//.}  &>/dev/null && echo ${p}${v//.}  && return
    done
    type ${p}         &>/dev/null && echo ${p}         && return
    echo "Could not find ${p}" 1>&2
    kill $KILL_PID
}

run mkdir -p config
run $(get libtoolize) --copy --force --automake
rm -f config.cache

run $(get aclocal 1.12)
# run $(get autoheader 2.59)
WANT_AUTOCONF=2.5 run $(get autoconf 2.68 2.67 2.65)
WANT_AUTOMAKE=1.12 run $(get automake 1.12) -a -c -W no-portability

echo "Success. Now run ./configure --help"
