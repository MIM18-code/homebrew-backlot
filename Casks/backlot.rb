cask "backlot" do
  version "0.4.2"
  sha256 "03dbda7f8d8d178542eb4117ec044b2132375370b231694affcfacf91805cd8e"

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
