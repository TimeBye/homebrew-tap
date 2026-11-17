class Mmh < Formula
  desc "Modular ssh toolkit"
  homepage "https://github.com/TimeBye/mmh"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/TimeBye/mmh/releases/download/v1.7.0/mmh_darwin_arm64"
      sha256 "ec0d27c1622d9d973a9670ee61c31ae26299f2bfb6d711af51c208b5a1570032"
    end
    on_intel do
      url "https://github.com/TimeBye/mmh/releases/download/v1.7.0/mmh_darwin_amd64"
      sha256 "4f4b66bf41685acaf09013cc0a6278b6a451bba1ceaafbdd5c43d6d1d5eb0921"
    end
  end

  def install
    binary = "mmh_darwin_#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    chmod 0755, binary
    bin.install binary => "mmh"

    %w[mcp mcs mcx mec mgo mping mtun].each do |cmd|
      bin.install_symlink "mmh" => cmd
    end
  end

  test do
    assert_match "Version: v#{version}", shell_output("#{bin}/mmh version")
    assert_predicate bin/"mping", :symlink?
  end
end
