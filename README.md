# Useful Defs for Books Written in LaTeX

First, add this repo as a submodule to your repo:

```bash
git add submodule https://github.com/yegor256/book.defs
```

Then, include them into your `Makefile` for [Make]:

```bash
include book.defs/book.defs
```

Then, keep all your `.tex` files in the `tex/` directory.
No subdirectories!
You should be able to use `help` target to see all avaiable features:

```text
make help
```

[Make]: https://www.gnu.org/software/make/
