#set -x

function check_has_update ()
{
    _remark="$1"
    _prev_f="$2"
    _curr="$3"

    _prev=$(cat ${_prev_f})
    printf "${_remark}: "
    if [[ ${_prev} = ${_curr} ]]
    then
        printf latest
    else
        printf "${_prev} -> ${_curr}"
        printf "${_curr}" > "${_prev_f}"
    fi
    echo
}

PREV_ESR=version.esr
CURR_ESR=$(curl -s https://download-installer.cdn.mozilla.net/pub/firefox/releases/ | grep esr/ | sed -E 's/.*">([0-9.]+esr)\/<.*/\1/' | sed '/^[^1-9]/d' | sort -g | tail -1)
check_has_update ESR ${PREV_ESR} ${CURR_ESR}

PREV_DEV=version.dev
CURR_DEV=$(curl -s https://download-installer.cdn.mozilla.net/pub/devedition/releases/ | sed -E 's/.*">([0-9.]+b?[1-9]+)\/<.*/\1/' | sed '/^[^1-9]/d' | sort -g | tail -1)
check_has_update DEV ${PREV_DEV} ${CURR_DEV}

PREV_NGT=version.ngt
CURR_NGT=$(curl -s https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-central/ | grep '>firefox.*x86_64.tar.xz<' | tail -n 1 | sed -E 's/.*firefox-([0-9.]+a[1-9]+)\..*/\1/')
check_has_update NGT ${PREV_NGT} ${CURR_NGT}

PREV_REL=version.release_prefix
CURR_REL=$(date +%y%m%d)
check_has_update REL ${PREV_REL} ${CURR_REL}

