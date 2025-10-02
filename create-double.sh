#!/bin/bash
# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

set -e -o pipefail

src=$1
target=$2
repo=$3

commands=(
    'faEnvelopeO [0] {}'
    'faTwitter [0] {}'
    'faLinkedin [0] {}'
    'faGithub [0] {}'
    'faInstagram [0] {}'
    'faFacebook [0] {}'
    'faThumbsUp [0] {}'
    'keys [1] {"Ctrl"}'
    'eolang [1] {EO}'
    'iexec [1] {}'
    'ffinput [1] {code skipped.}'
    'ix [1] {#1}'
    'ixx [2] {#2}'
    'jttu [1] {}'
    'url [1] {}'
    'footlink [1] {}'
    'qte [1] {#1}'
    'citep [2][] {}'
    'qq [1] {#1}'
    'lib [1] {OpenJDK}'
    'ff [1] {file}'
    'lang [1] {#1}'
    'org [1] {Microsoft}'
    'term [1] {#1}'
    'format [1] {#1}'
    'qrcode [1] {}'
    'anti [1] {#1}'
    'citetitle [1] {Object Thinking}'
    'human [2] {Jeffrey Lebowski}'
    'citet [2][] {Jeff and Donny}'
    'citeyear [1] {1976}'
    'cref [1] {Section 14}'
    'sref [1] {Section 14}'
    'antipattern [1] {Name}'
    'novale [2] {===#1==#2===}'
    'onlyvale [1] {#1}'
    'nospell [1] {Something}'
)

packages=( xcolor paralist multicol booktabs tikz to-be-determined )

(
    printf '\\documentclass{article}\n'
    for p in "${packages[@]}"; do
        printf '\\usepackage{%s}\n' "${p}"
    done
    for lib in calc tikzmark; do
        printf '\\usetikzlibrary{%s}\n' "${lib}"
    done
    for b in "${commands[@]}"; do
        cmd=$(echo "${b}" | cut -f1 -d' ')
        args=$(echo "${b}" | cut -f2 -d' ')
        rep=$(echo "${b}" | cut -f3- -d' ')
        printf '\\newcommand\\%s%s{\\textcolor{orange}{%s}}\n' "${cmd}" "${args}" "${rep}"
    done
    printf '\\newenvironment{gpt}{}{}\n'
    printf '\\tolerance=1\n'
    printf '\\emergencystretch=\maxdimen\n'
    printf '\\hyphenpenalty=10000\n'
    printf '\\hbadness=10000\n'
    printf '\\setlength{\\parskip}{2em}\n'
    if [ -e "${repo}/.eloquence.double.tex" ]; then
        cat "${repo}/.eloquence.double.tex"
    fi
    if [ -e "${repo}/.eloquence.double.sh" ]; then
        bash "${repo}/.eloquence.double.sh"
    fi
    printf '\\begin{document}\n'
    printf '\\thispagestyle{empty}\n'
    perl -0777 -p -e "s/\\\begin\{(ffcode|ffsave)\}(\\[.*\\])?\\n(([^\\\][^\\n]*|)\\n)+\\\end\{(ffcode|ffsave)\}/code skipped./smg" "${src}" \
        | perl -0777 -p -e "s|\\\endinput||smg" \
        | perl -0777 -p -e "s/\\\input\{.*\}/input skipped./smg"
    printf '\\end{document}\n'
) > "${target}"
