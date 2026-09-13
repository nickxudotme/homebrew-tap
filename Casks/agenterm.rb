cask "agenterm" do
  version "0.1.0"
  sha256 "2c25fabf4095039b6bbb6666d716b8eecef4b220a8721b1a290564b8b00ac5eb"

  url "https://github.com/nickxudotme/agenterm/releases/download/v#{version}/Agenterm-#{version}-arm64.zip"
  name "Agenterm"
  desc "Local-first terminal with ZMODEM file transfer"
  homepage "https://agenterm.nickxu.me/"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Agenterm.app"

  caveats <<~EOS
    Agenterm has been installed successfully!

    If macOS prevents Agenterm from opening on first launch,
    run the following command once:

        xattr -dr com.apple.quarantine /Applications/Agenterm.app

    Then launch Agenterm again.

    ----------------------------------------

    Agenterm 安装成功！

    如果首次打开时 macOS 阻止启动，请执行下面的命令：

        xattr -dr com.apple.quarantine /Applications/Agenterm.app

    然后重新打开 Agenterm 即可。

    GitHub:
      https://github.com/nickxudotme/agenterm
  EOS
end
