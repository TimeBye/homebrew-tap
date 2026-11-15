class Mmh < Formula
  desc "Modular ssh toolkit"
  homepage "https://github.com/TimeBye/mmh"
  url "https://github.com/TimeBye/mmh/releases/download/v1.6.0/mmh_darwin_universal"
  sha256 "24a25dbf766de6e60daf52320c6e286c489e1e1282407caf34b3ff2ebb3b66a3"
  license "Apache-2.0"

  def install
    bin.install "mmh_darwin_universal" => "mmh"
    %w[mcp mcs mcx mec mgo mping mtun].each do |cmd|
      bin.install_symlink "mmh" => cmd
    end
  end

  test do
    assert_match "v1.6.0", shell_output("#{bin}/mmh version")
    assert_predicate bin/"mping", :symlink?
  end
end
