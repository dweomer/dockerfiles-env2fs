#!/bin/bash -e

for f in $(declare -p | awk '{print $3}' | egrep '^[/]'); do
    mkdir -vp $(dirname ${f})
    ruby -e "puts ENV[\"${f}\"]" > ${f}
done

exec $@
