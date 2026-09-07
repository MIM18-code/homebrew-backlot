cask "backlot" do
  version "0.3.0"
  sha256 "26bbff49a1b9ae7eaf42a5bc92d689080c6c8d45ac878aa8ab605e8e12c0ac11"

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
