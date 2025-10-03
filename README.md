# Useful Defs for Books Written in LaTeX

[![make](https://github.com/yegor256/eloquence/actions/workflows/make.yml/badge.svg)](https://github.com/yegor256/eloquence/actions/workflows/make.yml)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/eloquence/blob/master/LICENSE.txt)

First, add this repo as a submodule to your repo:

```bash
git add submodule https://github.com/yegor256/eloquence
```

Then, install [Vale], [texsc], [aspell], [ltex], and [pdftotext].

Then, add this line to the bottom of your [Make] `Makefile`:

```bash
include eloquence/eloquence.defs
```

You should be able to use `eloquence` target to check your code for proper
  grammar and spelling:

```text
make eloquence
```

Keep all your `.tex` files in the `tex/` directory.
No subdirectories!

Don't forget to add `.eloquence/` to `.gitignore`.

## How to Configure

You can create the `.eloquence.double.tex` file in the root of your codebase.
It will be included into every `.tex` document before sending it to Vale.

You can also create `.eloquence.double.sh` file.
It will be executed with a single parameter: path of `.tex` file.
You can modify the provided TeX document before it goes to Vale.

## How to Contribute

Fork repository, make changes, send us a
[pull request](https://www.yegor256.com/2014/04/15/github-guidelines.html).
We will review your changes and apply them to the `master` branch shortly,
provided they don't violate our quality standards. To avoid frustration,
before sending us your pull request please run full Make build:

```bash
make
```

You will need [GNU Make][Make] 4+.

[Make]: https://www.gnu.org/software/make/
[Vale]: https://vale.sh/
[texsc]: https://github.com/yegor256/texsc
[pdftotext]: https://pypi.org/project/pdftotext/
[aspell]: http://aspell.net/
[ltex]: https://valentjn.github.io/ltex/ltex-ls/installation.html
