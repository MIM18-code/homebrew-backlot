cask "backlot" do
  version "0.7.0-beta.8"
  sha256 "68d84ebc1bda6488b518afa819981fe18220065cbb6ae279c0c80bbb3f24b949"

  url "https://github.com/MIM18-code/homebrew-backlot/releases/download/v#{version}/Backlot-#{version}.dmg"
  name "Backlot"
  desc "Production office for film budgets, breakdowns, schedules and call sheets"
  homepage "https://github.com/MIM18-code/homebrew-backlot"

  livecheck do
    url "https://github.com/MIM18-code/homebrew-backlot/releases/latest"
    regex(%r{/tag/v?(\d+(?:\.\d+)+(?:-beta\.\d+)?)$}i)
    strategy :header_match
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Backlot.app"

  zap trash: [
    "~/.backlot",
    "~/Library/Application Support/Backlot",
  ]

  caveats <<~EOS
    Script import, scene reading, actor sides, tagged FDX and PDF output are included.
    No separate reader, Python environment, Chrome installation or AI account is needed.
    Advanced budget integrations remain separate. Setup and troubleshooting:
      https://mindinmotionsoftware.com/guides/backlot/index.html
  EOS
end
