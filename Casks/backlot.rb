cask "backlot" do
  version "0.1.0"
  sha256 "127d2d26bebcaa6ca7def1fe05370dd80954c39dce4eb4609dfa194279734a36"

  url "https://github.com/MIM18-code/homebrew-backlot/releases/download/v#{version}/Backlot-#{version}.dmg"
  name "Backlot"
  desc "Local production office: budget, breakdown, stripboard, DOOD, call sheets, with an MCP server"
  homepage "https://github.com/MIM18-code/homebrew-backlot"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Backlot.app"

  zap trash: [
    "~/.backlot",
    "~/Library/Application Support/Backlot",
  ]

  caveats <<~EOS
    Backlot is not signed or notarized. If macOS blocks the first launch, run
      xattr -dr com.apple.quarantine /Applications/Backlot.app
    or use Open Anyway in System Settings > Privacy & Security after the
    first attempt.

    PDF printing needs Google Chrome. Script and budget engines are optional;
    see the README for BACKLOT_SCRIPT_PY and BACKLOT_BUDGET_PY.
  EOS
end
