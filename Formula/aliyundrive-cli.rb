class AliyundriveCli < Formula
  desc "阿里云盘命令行客户端"
  version "0.14.5"
  homepage "https://github.com/chyroc/aliyundrive-cli"
  license "Apache-2.0"

  on_intel do
    url "https://github.com/chyroc/aliyundrive-cli/releases/download/v0.14.5/aliyundrive-cli_Darwin_x86_64"
    sha256 "f25da7f7cca8727c635563e5284fa64f6208d00df5bad29f0362fbef75218aa9"
  end

  on_arm do
    url "https://github.com/chyroc/aliyundrive-cli/releases/download/v0.14.5/aliyundrive-cli_Darwin_arm64"
    sha256 "bc966d620619f4142645f1b05acff1649cbdeecc3e570fa2d819a54ac48197d2"
  end

  def install
    bin.install "aliyundrive-cli_Darwin_arm64" => "aliyundrive-cli" if Hardware::CPU.arm?
    bin.install "aliyundrive-cli_Darwin_x86_64" => "aliyundrive-cli" if Hardware::CPU.intel?
  end

  test do
    system "#{bin}/aliyundrive-cli", "-version"
  end
end
