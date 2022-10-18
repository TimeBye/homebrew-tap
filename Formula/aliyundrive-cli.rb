# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AliyundriveCli < Formula
  desc "阿里云盘命令行客户端"
  version "0.13.0"
  homepage "https://github.com/chyroc/aliyundrive-cli"
  url "https://github.com/chyroc/aliyundrive-cli/releases/download/v0.13.0/aliyundrive-cli_0.13.0_Darwin_x86_64.tar.gz"
  sha256 "0a61cf44ae80ebc0c578f765e160e3effb8f28b4d24d67c41086901cf7f39dbd"
  license "Apache-2.0"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install "aliyundrive-cli"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test aliyundrive-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "aliyundrive-cli -version"
  end
end
