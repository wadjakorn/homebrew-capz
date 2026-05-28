cask "capz" do
  version "0.5.3"
  sha256 arm:   "4667a8b6558e911dbb94957e2efffcb1e39131d1874c801bf885cad17364d6dd",
         intel: "d511e6ae0662bc8b051fb9daf7c576b23a4a225e6602087010fe216c90067f88"

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
