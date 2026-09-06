# Homebrew tap for Backlot

Backlot is a local production office for indie features: budget, script breakdown, stripboard, day out of days, call sheets and daily reports, with an MCP server so Claude and other agents can work the same project file.

## Install

```bash
brew tap MIM18-code/backlot
brew trust MIM18-code/backlot
brew install --cask backlot
xattr -dr com.apple.quarantine /Applications/Backlot.app
```

Recent Homebrew refuses casks from third-party taps until you trust the tap once; that is the second line. The build is unsigned and not notarized, and Homebrew 6 no longer offers a no-quarantine option, so the last line clears the quarantine flag. Skip it and macOS blocks the first launch until you use Open Anyway in System Settings > Privacy & Security.

Apple Silicon and macOS 13 or later. Upgrade with `brew upgrade --cask backlot`. Remove with `brew uninstall --cask backlot`; add `--zap` to also delete `~/.backlot`.

## Optional prerequisites

| Capability | Needs |
| --- | --- |
| PDF printing and issuing call sheets | Google Chrome |
| FDX and Fountain reading, breakdown import, sides | The screenwriting engine and its Python environment, `BACKLOT_SCRIPT_PY` if the interpreter is not `~/screenwriting-mcp-venv/bin/python` |
| Gorilla workbooks and Movie Magic XML | The film-budget engine, `BACKLOT_BUDGET_PY` likewise |
| Email | A Resend account or Google Workspace OAuth client |
| AI assists | Local Ollama or your own API key |

The app checks these at startup and says what is missing.

## How releases land here

The DMG is built from the private source repository with `npm run app:build`, uploaded to a release on this repository tagged `v<version>`, and `scripts/homebrew-cask.mjs` writes `Casks/backlot.rb` with the matching sha256.
