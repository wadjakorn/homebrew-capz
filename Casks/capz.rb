cask "capz" do
  version "0.5.1"
  sha256 arm:   "be4a0fb196ffcca9be2606c1295b428390c4cd1ddae689d5c64eb27843077066",
         intel: "aa909c248b68531487ef43e76fd80420b0f1f9491783e98a0f47a44d117e74eb"

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
