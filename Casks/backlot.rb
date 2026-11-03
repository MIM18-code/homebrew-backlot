cask "backlot" do
  version "0.7.0-beta.7"
  sha256 "feac80c769adb661a591a34b754adc6c75cd1b46401a6d581f229d46f2a81ceb"

  url "https://github.com/MIM18-code/homebrew-backlot/releases/download/v#{version}/Backlot-#{version}.dmg"
  name "Backlot"
  desc "Production office for film budgets, breakdowns, schedules and call sheets"
  homepage "https://github.com/MIM18-code/homebrew-backlot"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Backlot.app"

  zap trash: [
    "~/.backlot",
    "~/Library/Application Support/Backlot",
  ]

  caveats <<~EOS
    Start with manual scene entry; no AI or extra downloads are required.
    Script import needs a separate engine not supplied by this installer.
    PDF printing needs Google Chrome. Setup and troubleshooting:
      https://mindinmotionsoftware.com/guides/backlot/index.html
  EOS
end
