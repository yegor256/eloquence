#!/bin/bash
#
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -e -o pipefail

target=$1

version=16.0.0
tgz=${target}/ltex.tgz
if [ ! -e "${tgz}" ] || [ ! -e "${target}/ltex" ]; then
    wget -N "https://github.com/valentjn/ltex-ls/releases/download/16.0.0/ltex-ls-${version}-mac-x64.tar.gz" -qq -O "${tgz}"
    rm -rf "${target}/ltex-ls-${version}"
    tar -xzf "${tgz}" -C "${target}"
    mv "${target}/ltex-ls-${version}" "${target}/ltex"
fi
