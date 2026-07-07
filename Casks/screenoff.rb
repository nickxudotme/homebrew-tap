cask "screenoff" do
  version "0.1.4"
  sha256 "c90f2c5bb24441936ebda1a24898d4443fbeb42963325d20352378561796b02b"

  url "https://github.com/nickxudotme/screenoff/releases/download/v#{version}/ScreenOff-#{version}.zip"
  name "ScreenOff"
  desc "Turn macOS displays off and restore them later"
  homepage "https://github.com/nickxudotme/screenoff"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ScreenOff.app"
  binary "#{appdir}/ScreenOff.app/Contents/Resources/screenoff"

  zap trash: [
    "~/Library/Preferences/me.nickxu.screenoff.plist",
  ]

  caveats <<~EOS
    ScreenOff is currently unsigned and not notarized. If macOS says the app
    is damaged, remove the quarantine attribute after installation:

      xattr -dr com.apple.quarantine /Applications/ScreenOff.app
  EOS
end
