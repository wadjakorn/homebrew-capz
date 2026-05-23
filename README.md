# homebrew-capz

Homebrew tap for [capz](https://github.com/wadjakorn/capz) — screenshot capture and annotation app.

## Install

```bash
brew tap wadjakorn/capz
brew install --cask capz
```

## Upgrade

```bash
brew update
brew upgrade --cask capz
```

## Uninstall

```bash
brew uninstall --cask capz
brew untap wadjakorn/capz
```

## Notes

- App is ad-hoc signed (no Apple Developer certificate). Brew handles quarantine attribute removal automatically.
- Built-in auto-updater handles in-place upgrades via Tauri's updater plugin. Brew acts as install-time delivery only.
- macOS 11 (Big Sur) or later required.
