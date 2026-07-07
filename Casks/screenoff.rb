cask "screenoff" do
  version "0.1.1"
  sha256 "35679fe2d6f8a85fe1a8f10e17fcac65899d28d810379a886c5b11482d74758d"

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
