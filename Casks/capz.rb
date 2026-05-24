cask "capz" do
  version "0.1.8"
  sha256 arm:   "46bdfa96ba99dc2652e774a424a7cbaf10d904e6d332ee3fbbf4045dbc9a1487",
         intel: "19843ec210857e9e23f3712f6cd1bfcbe720874cab93257ade1848f3fab1c286"

  arch arm: "aarch64", intel: "x64"

  url "https://github.com/wadjakorn/capz/releases/download/v#{version}/capz_#{version}_#{arch}.dmg",
      verified: "github.com/wadjakorn/capz/"
  name "capz"
  desc "Screenshot capture and annotation"
  homepage "https://github.com/wadjakorn/capz"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "capz.app"

  zap trash: [
    "~/Library/Application Support/dev.baze.capz",
    "~/Library/Caches/dev.baze.capz",
    "~/Library/Logs/dev.baze.capz",
    "~/Library/Preferences/dev.baze.capz.plist",
    "~/Library/Saved Application State/dev.baze.capz.savedState",
  ]
end
