cask "akoya" do
  version "0.2.0"
  sha256 "fcd2fd6a9a0e9b19d256e18b481aeb077d718399aa7dc5b092cefd69907e7520"
  url "https://github.com/rohitnikamm/akoya/releases/download/v#{version}/Akoya-v#{version}.zip"
  name "Akoya"
  desc "Push-to-talk dictation that lives in the menu bar"
  homepage "https://github.com/rohitnikamm/akoya"
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64
  app "Akoya.app"
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Akoya.app"], must_succeed: false
  end
  uninstall quit: "com.rohitnikamm.akoya"
  zap trash: ["~/Library/Application Support/Akoya", "~/Library/Preferences/com.rohitnikamm.akoya.plist"]
end
