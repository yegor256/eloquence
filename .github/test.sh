#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -e -o pipefail

tmp=.test
mkdir -p "${tmp}"
mkdir "${tmp}/eloquence"
cp -R ./*.sh eloquence.defs .vale.ini vale-styles "${tmp}/eloquence"
cd "${tmp}"

mkdir tex
echo "Hello, world!" > tex/hello.tex

echo "include eloquence/eloquence.defs" > Makefile

make eloquence
make texsc
make ltex
make vale
