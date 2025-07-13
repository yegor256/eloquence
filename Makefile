# SPDX-FileCopyrightText: Copyright (c) Yegor Bugayenko, 2025
# SPDX-License-Identifier: MIT

.ONESHELL:
.SHELLFLAGS := -e -o pipefail -c
.PHONY: all clean test
SHELL := bash

all: test

test:
	.github/test.sh

clean:
	rm -rf .test
