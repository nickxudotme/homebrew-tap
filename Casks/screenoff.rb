cask "screenoff" do
  version "0.1.0"
  sha256 "397ecc200c02d799c462689368289f1d48cae571302b6f1b7ca0b7bb188be4a0"

  url "https://github.com/nickxudotme/screenoff/releases/download/v#{version}/ScreenOff-#{version}.zip"
  name "ScreenOff"
  desc "Turn macOS displays off and restore them later"
  homepage "https://github.com/nickxudotme/screenoff"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "ScreenOff.app"
  binary "#{appdir}/ScreenOff.app/Contents/Resources/screenoff"

  zap trash: [
    "~/Library/Preferences/me.nickxu.screenoff.plist",
  ]
end
