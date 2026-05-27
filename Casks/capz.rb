cask "capz" do
  version "0.4.1"
  sha256 arm:   "369cf7ef2593ce596dcb917b71d631ee8d978d82ae108a9be807c91b2a063948",
         intel: "78ae8333c66b689af04cac4fe551f328021d3050675055e5ab9eabd21d8d6f55"

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
