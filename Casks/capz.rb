cask "capz" do
  arch arm: "aarch64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "d3978c65dd58b3d75bbf7965fcce5cd7cf7ac5b7feb49faeba5a2aae3dbfc9d6",
         intel: "7079434ebb93075b390d51a01dc00d44a378d933135c0421e44f2a1a595cde13"

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
