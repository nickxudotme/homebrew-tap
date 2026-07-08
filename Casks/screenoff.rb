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
    🎉 ScreenOff has been installed successfully!

    If macOS prevents ScreenOff from opening on first launch,
    run the following command once:

        xattr -dr com.apple.quarantine /Applications/ScreenOff.app

    Then launch ScreenOff again.

    ────────────────────────────────────────

    🎉 ScreenOff 安装成功！

    如果首次打开时 macOS 阻止启动，请执行下面的命令：

        xattr -dr com.apple.quarantine /Applications/ScreenOff.app

    然后重新打开 ScreenOff 即可。

    GitHub:
      https://github.com/nickxudotme/screenoff
  EOS
end
