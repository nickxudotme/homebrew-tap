cask "screenoff" do
  version "0.1.2"
  sha256 "7d86cec2250b0b77aca1e10b583110e1f87654bb72d8c09bbfc10433f98f81c9"

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
