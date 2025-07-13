# Useful Defs for Books Written in LaTeX

First, add this repo as a submodule to your repo:

```bash
git add submodule https://github.com/yegor256/eloquence
```

Then, include them into your `Makefile` for [Make]:

```bash
include eloquence/eloquence.defs
```

Then, keep all your `.tex` files in the `tex/` directory.
No subdirectories!
You should be able to use `eloquence` target to see all available features:

```text
make eloquence
```

Don't forget to add `.eloquence/` to `.gitignore`.

[Make]: https://www.gnu.org/software/make/
