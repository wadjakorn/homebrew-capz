cask "capz" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.1"
  sha256 arm:   "9547624e75a8344bdc99082731cd8cd97ca7d7b37d51a2d9424f3ed65cef529a",
         intel: "f59adbb61dc07b1cc529f73e3d2fee446cae914a1b868d2e9648c8026a143b84"

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
