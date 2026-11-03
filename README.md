# Homebrew tap for Backlot

Backlot is a local production office for indie features: budget, script breakdown, stripboard, day out of days, call sheets and daily reports, with an MCP server so Claude and other agents can work the same project file.

## Install

```bash
brew tap MIM18-code/backlot
brew trust MIM18-code/backlot
brew install --cask backlot
```

Recent Homebrew refuses casks from third-party taps until you trust the tap once; that is the second line. Since 0.7.0 beta 1 the app is signed with MindInMotion LLC's Developer ID and notarized by Apple, so it opens on first launch with no extra step.

Apple Silicon and macOS 13 or later. Upgrade with `brew upgrade --cask backlot`. Remove with `brew uninstall --cask backlot`; add `--zap` to also delete `~/.backlot`.

## Included and optional features

Beta 8 includes script import, scene reading, actor sides, tagged FDX export and
desktop PDF output. Those workflows need no Python environment, separate Chrome
installation or AI account.

| Capability | Needs |
| --- | --- |
| Gorilla workbooks and Movie Magic budget/schedule XML | A compatible separately configured budget integration; formats are disabled when unavailable |
| Email | A Resend account or Google Workspace OAuth client |
| AI assists | Local Ollama, your ChatGPT plan, or your own API key |

PDF and CSV exports work without those optional integrations.

## User guide

[Read the Backlot guide](https://mindinmotionsoftware.com/guides/backlot/index.html) for setup, screenshots, captioned walkthroughs and troubleshooting. You can also [download the complete guide](https://mindinmotionsoftware.com/downloads/Backlot-user-guide.zip) to read it and watch the videos offline.

Start with an empty practice project and import an FDX or Fountain screenplay, or enter a scene manually. The guide includes fictional scripts to try. No external engine or AI setup is needed.

## How releases land here

The DMG is built, signed and notarized from the private source repository with `npm run release:prepare`, uploaded to a release on this repository tagged `v<version>`, and `scripts/homebrew-cask.mjs` writes `Casks/backlot.rb` with the matching sha256.

Each release also carries the source archives for the bundled runtime (Electron, Chromium, Chromium's FFmpeg fork and NASM) and a `SHA256SUMS` file. Backlot's license and third-party notices ship inside the app.
