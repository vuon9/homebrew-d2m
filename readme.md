# vuon9/d2m Homebrew Tap

This repository contains cask for use with Homebrew: https://brew.sh

Installation can be accomplished with either of the following two methods -

```
brew install --cask vuon9/d2m/d2m
```

OR

```
brew tap vuon9/d2m
brew install --cask d2m
```

Additionally, use `--no-quarantine` with `brew install` on `arm64` machines, which otherwise ends up in _Signature verification failed_ error.

To upgrade manually, run `brew upgrade --cask d2m`.

To uninstall, run `brew uninstall --cask d2m`. Additionally you can use `--zap` to remove app-data and if you want to remove the tap after uninstall, run `brew untap vuon9/d2m`.
