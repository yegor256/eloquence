#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -ex -o pipefail

tmp=.test
mkdir -p "${tmp}/eloquence"
cp -R eloquence.defs ./*.sh ltex.json vale.ini vale-styles "${tmp}/eloquence"
cd "${tmp}"

mkdir -p tex
cat > tex/hello.tex <<EOT
Hello, world.
\begin{ffcode}[columns=fullflexible]
This should be replaced.
\end{ffcode}
EOT

echo "include eloquence/eloquence.defs" > Makefile

make clean
make .eloquence/double/hello.tex
make .eloquence/pdf/hello.pdf
make .eloquence/md/hello.md
make texsc
make vale
make ltex
make eloquence
