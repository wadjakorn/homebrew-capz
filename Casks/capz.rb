cask "capz" do
  version "0.1.4"
  sha256 arm:   "9af3295e48148b5560861b46fdc66c6323992c2e6e6611c233e620981a8296ab",
         intel: "6857c2e5e8b6a20b9c49c5cf09d01da7858b86a24df325ad8e8046850fb7860b"

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
