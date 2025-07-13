#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -e -o pipefail

tex=$1
pdf=$2

tmp=$(mktemp -d)
cp "${tex}" "${tmp}/double.tex"
cd "${tmp}"
if ! pdflatex -interaction=errorstopmode -halt-on-error -no-shell-escape double.tex > log.txt 2>&1; then
    cat log.txt
    exit 1
fi
cd -
mv "${tmp}/double.pdf" "${pdf}"
