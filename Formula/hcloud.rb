class HcloudRemoteSha256DownloadStrategy < CurlDownloadStrategy
  def verify_download_integrity(fn)
    sha256_url = "#{url}.sha256"
    result = Utils::Curl.curl_output("--silent", "--location", "--fail", "--retry", "2", sha256_url)

    unless result.success?
      raise DownloadError.new(
        "无法从 #{sha256_url} 获取校验文件: #{result.stderr.presence || 'HTTP 请求失败'}",
        url
      )
    end

    match = result.stdout.match(/\b([a-fA-F0-9]{64})\b/)
    unless match
      raise DownloadError.new(
        "从 #{sha256_url} 解析 sha256 失败，原始内容：#{result.stdout.inspect}",
        url
      )
    end

    expected = match[1].downcase
    actual = fn.sha256

    return if expected == actual

    raise ChecksumMismatchError.new(fn, Checksum.new(expected), Checksum.new(actual))
  end
end

class Hcloud < Formula
  desc "华为云命令行工具"
  homepage "https://support.huaweicloud.com/productdesc-hcli/hcli_01.html"
  version "latest"
  license "Apache-2.0"

  on_intel do
    url "https://cn-north-4-hdn-koocli.obs.cn-north-4.myhuaweicloud.com/cli/latest/huaweicloud-cli-mac-amd64.tar.gz",
        using: HcloudRemoteSha256DownloadStrategy
  end

  on_arm do
    url "https://cn-north-4-hdn-koocli.obs.cn-north-4.myhuaweicloud.com/cli/latest/huaweicloud-cli-mac-arm64.tar.gz",
        using: HcloudRemoteSha256DownloadStrategy
  end

  def install
    bin.install "hcloud"
  end

  test do
    system "#{bin}/hcloud", "version"
  end
end
