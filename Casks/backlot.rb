cask "backlot" do
  version "0.2.1"
  sha256 "bef69947865a1d432db2fa8ff903cf26147b3bcada4e52c7abd831e1043afd08"

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
