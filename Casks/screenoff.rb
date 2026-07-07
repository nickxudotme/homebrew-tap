cask "screenoff" do
  version "0.1.3"
  sha256 "d8093904cf1286783609ed23d41ab586d1a4c0ce343650cd70f324379b7c9626"

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
