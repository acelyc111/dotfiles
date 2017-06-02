#!/bin/bash
if [ $# -lt 1 ]; then
    echo "need at least 1 argument"
    exit 0
fi

path=$2
if test -z $path ; then
    path=$PWD
fi

if ! test -z $3 ; then
    exclude="svn|tags|logs|"${3}
else
    exclude="svn|tags|logs"
fi

echo -e 'start to find \033[40;32m'$1'\033[0m in \033[40;32m'$path'\033[0m'
find $path | xargs egrep "${1}" -n | egrep -v "${exclude}" | egrep "${1}" --color=auto
