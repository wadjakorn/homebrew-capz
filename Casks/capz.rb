cask "capz" do
  arch arm: "aarch64", intel: "x64"

  version "0.21.0"
  sha256 arm:   "a0de3b53cb72ea0164336e7d65c32b5e504d4e4bed71a994770cad40df1b74b1",
         intel: "375e616563712d03ed83193308806b85ca43f9f42cb43e9ff8702080d9bdef97"

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
