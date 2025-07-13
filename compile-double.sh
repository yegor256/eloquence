#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -e -o pipefail

tex=$1
pdf=$2

tmp=$(mktemp -d)
cp "${tex}" "${tmp}/section.tex"
cd "${tmp}"
pdflatex -interaction=errorstopmode -halt-on-error -no-shell-escape section.tex > /dev/null
cd -
mv "${tmp}/section.pdf" "${pdf}"
