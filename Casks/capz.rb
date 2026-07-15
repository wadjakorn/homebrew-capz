cask "capz" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.2"
  sha256 arm:   "a53d49d5587f28d131372d385fe8c91acef1b3c429463fba14b723b9fc510145",
         intel: "e8a6067fbbdd060ff2f59e6976302173f947d29758dbca7fb71ebedb0f7bcdc6"

  url "https://github.com/wadjakorn/capz/releases/download/v#{version}/capz_#{version}_#{arch}.dmg",
      verified: "github.com/wadjakorn/capz/"
  name "capz"
  desc "Screenshot capture and annotation tool"
  homepage "https://github.com/wadjakorn/capz"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :ventura

  app "capz.app"

  # Strip macOS quarantine xattr so unsigned/un-notarized build opens without
  # the "Apple could not verify capz.app is free of malware" Gatekeeper prompt.
  # Remove once the app is signed with a Developer ID + notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/capz.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/dev.baze.capz",
    "~/Library/Caches/dev.baze.capz",
    "~/Library/Logs/dev.baze.capz",
    "~/Library/Preferences/dev.baze.capz.plist",
    "~/Library/Saved Application State/dev.baze.capz.savedState",
    "~/Library/WebKit/dev.baze.capz",
  ]
end
