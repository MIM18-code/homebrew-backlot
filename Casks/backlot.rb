cask "backlot" do
  version "0.7.0-beta.4"
  sha256 "ae105dc7c2ca6e9e1ee67feec34d7b943c64581ddd5e9d886f36fd1aa2b746f3"

  url "https://github.com/MIM18-code/homebrew-backlot/releases/download/v#{version}/Backlot-#{version}.dmg"
  name "Backlot"
  desc "Local production office: budget, breakdown, stripboard, DOOD, call sheets, with an MCP server"
  homepage "https://github.com/MIM18-code/homebrew-backlot"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Backlot.app"

  zap trash: [
    "~/.backlot",
    "~/Library/Application Support/Backlot",
  ]

  caveats <<~EOS
    PDF printing needs Google Chrome. Script and budget engines are optional;
    see the README for BACKLOT_SCRIPT_PY and BACKLOT_BUDGET_PY.
  EOS
end
