cask "capz" do
  arch arm: "aarch64", intel: "x64"

  version "0.18.2"
  sha256 arm:   "545ed4885a4d3929d7a7072d3a6a0cd45a27cca1e1cbf16a5a0bffeb6189b936",
         intel: "bb6f90eb47f47ab6d0405a07356561893ed45e67d8832e9aa7b4e863288d8a59"

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
