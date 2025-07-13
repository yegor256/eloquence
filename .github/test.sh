#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -e -o pipefail

tmp=.test
mkdir -p "${tmp}/eloquence"
cp -R ./*.sh ltex.json eloquence.defs .vale.ini vale-styles "${tmp}/eloquence"
cd "${tmp}"

mkdir -p tex
echo "Hello, world." > tex/hello.tex

echo "include eloquence/eloquence.defs" > Makefile

make eloquence
make texsc
make .eloquence/fake/hello.tex
make .eloquence/pdf/hello.pdf
make .eloquence/md/hello.md
make vale
make ltex
