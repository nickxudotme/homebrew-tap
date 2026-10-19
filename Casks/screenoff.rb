cask "screenoff" do
  version "0.1.5"
  sha256 "791eb142bb7477c8cbe7f4899c98a242bdd0cccf40d9422764736b8167457e6c"

  url "https://github.com/nickxudotme/screenoff/releases/download/v#{version}/ScreenOff-#{version}.zip"
  name "ScreenOff"
  desc "Turn displays off and restore them later"
  homepage "https://github.com/nickxudotme/screenoff"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ScreenOff.app"
  binary "#{appdir}/ScreenOff.app/Contents/Resources/screenoff"

  postflight_steps do
    run "/usr/bin/printf",
        args:         [
          "%s\n",
          "ScreenOff is not notarized. Removing its quarantine attribute to allow launching.",
          "ScreenOff 尚未经过 Apple 公证，即将移除该应用的隔离标记以允许启动。",
          "Command / 即将执行的命令：",
          'sudo /usr/bin/xattr -dr com.apple.quarantine "{{appdir}}/ScreenOff.app"',
          "If prompted for Password, enter your Mac administrator password (input is hidden).",
          "如提示 Password，请输入 Mac 管理员密码（输入时不会显示字符）。",
        ],
        print_stdout: true

    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/ScreenOff.app"],
        sudo: true
  end

  zap trash: "~/Library/Preferences/me.nickxu.screenoff.plist"

  caveats <<~EOS
    ScreenOff's quarantine attribute is removed automatically during installation.
    安装时已自动移除 ScreenOff 的隔离标记，可直接打开应用。

    GitHub:
      https://github.com/nickxudotme/screenoff
  EOS
end
