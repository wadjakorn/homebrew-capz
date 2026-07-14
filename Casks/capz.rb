cask "capz" do
  version "0.9.1"
  sha256 arm:   "74542d85c388b50c5d8a820ded52ac7cafd26ad94414d0cfbda447d7172cd5ec",
         intel: "7ab0d49a93439c3554b4ccae8f3a71d504cea703214679a4d7275d5046ce450a"

  arch arm: "aarch64", intel: "x64"

  url "https://github.com/wadjakorn/capz/releases/download/v#{version}/capz_#{version}_#{arch}.dmg",
      verified: "github.com/wadjakorn/capz/"
  name "capz"
  desc "Screenshot capture and annotation"
  homepage "https://github.com/wadjakorn/capz"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "capz.app"

  # Strip macOS quarantine xattr so the unsigned/un-notarized build opens
  # without the "Apple could not verify capz.app is free of malware" prompt.
  # Remove once the app is Developer ID signed + notarized.
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
  ]
end
