class Mmh < Formula
  desc "Modular ssh toolkit"
  homepage "https://github.com/TimeBye/mmh"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/TimeBye/mmh/releases/download/v1.6.0/mmh_darwin_arm64"
      sha256 "b0f3cb4786bfa33bbadf8f34a6b87bd33e4a302a0c6a34385b7d196da8fc09ed"
    end
    on_intel do
      url "https://github.com/TimeBye/mmh/releases/download/v1.6.0/mmh_darwin_amd64"
      sha256 "4ed19f90b3cf8691f0eeedab45a5c1b5c0e00fe3160b6475e868458777d18594"
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
    assert_match "v1.6.0", shell_output("#{bin}/mmh version")
    assert_predicate bin/"mping", :symlink?
  end
end
