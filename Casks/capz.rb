cask "capz" do
  version "0.5.6"
  sha256 arm:   "57e5afc3a3c3ae854f06f4e4139b9653f21aa8a6ed2cdc408c257a1c3f9db5e3",
         intel: "cf58708bf7bd9ea9c2e45ad6d1a40a5bbbb32a6972ed25156bfd8cd81f98f854"

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
