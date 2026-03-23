class Hcloud < Formula
  desc "华为云命令行工具"
  homepage "https://support.huaweicloud.com/productdesc-hcli/hcli_01.html"
  version "latest"
  license "Apache-2.0"

  on_intel do
    url "https://cn-north-4-hdn-koocli.obs.cn-north-4.myhuaweicloud.com/cli/latest/huaweicloud-cli-mac-amd64.tar.gz"
    sha256 "6cc4bd6079d9afb5f0c185d032b03b3cd4c9c6dd87a1846fe3d8089ebd888866"
  end

  on_arm do
    url "https://cn-north-4-hdn-koocli.obs.cn-north-4.myhuaweicloud.com/cli/latest/huaweicloud-cli-mac-arm64.tar.gz"
    sha256 "5fdb65e3bfa466516ed2acd6e07c28b2e424ba76a744fc8f4671a1b79824f789"
  end

  def install
    bin.install "hcloud"
  end

  test do
    system "#{bin}/hcloud", "version"
  end
end
