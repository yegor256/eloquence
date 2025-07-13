# Useful Defs for Books Written in LaTeX

First, add this repo as a submodule to your repo:

```bash
git add submodule https://github.com/yegor256/eloquence
```

Then, install [Vale], [texsc], and [pdftotext].

Then, put this into your [Make] `Makefile`:

```bash
include eloquence/eloquence.defs
```

Keep all your `.tex` files in the `tex/` directory.
No subdirectories!

You should be able to use `eloquence` target to check your code for proper
  grammar and spelling:

```text
make eloquence
```

Don't forget to add `.eloquence/` to `.gitignore`.

[Make]: https://www.gnu.org/software/make/
[Vale]: https://vale.sh/
[texsc]: https://github.com/yegor256/texsc
[pdftotext]: https://pypi.org/project/pdftotext/
