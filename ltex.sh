#!/bin/bash
#
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -e -o pipefail

cli=$1
json=$2

IFS=' ' read -ra texs <<< "$3"

files=()
passed=0
for t in "${texs[@]}"; do
    files+=( "${t}" )
    size=${#files[@]}
    passed=$(( passed + 1 ))
    if [ "${size}" -gt 100 ] || [ "${passed}" -eq "${#texs[@]}" ]; then
        "${cli}" "--client-configuration=${json}" "${files[@]}"
        echo "LTeX finished another ${size} files out of ${#texs[@]}"
        files=()
    fi
done
