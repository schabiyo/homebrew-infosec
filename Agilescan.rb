require "FileUtils"

class Agilescan < Formula
  desc "Deploying Agilescan agent"
  homepage "https://github.com/schabiyo/infosec"
  url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan-darwin-amd64-0.1.4.tar.gz"
  sha256 "c4bb34abd18ef743572c085fcbaf0a4d5c0770a7c889ae5ce422213bb35e80d4"
  head "https://github.com/schabiyo/infosec.git"

  if os.Mac?
    url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan_macOs_64bit.zip"
    sha256 "9ee30fc358fae8d248a2d7538957089885da321dca3f09e3296fe2058e7ff74"
    abort("MAc Os  is not supported")
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan_Linux_64bit.zip"
    sha256 "b41bebd25fd7bb1a67dc2cd5ee12c9f67073094567fdf7b3871f05fd74a45fdd"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan_Linux_armv7.zip"
    sha256 "78f31239430eaaec01df783e2a3443753a8126c325292ed8ddb1658ddd2b401d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan_Linux_arm64.zip"
    sha256 "97cadca3c3c3f36388a4a601acf878dd356d6275a976bee516798b72bfdbeecf"
  end
  if OS.windows?
    puts "Windows is not supported".inspect
    abort("Windows is not supported")
  end

  depends_on "git"
  depends_on "zsh" => :optional

  def install
    bin.install "agilescan"
  end

  def post_install
    etc.install "agilescan.conf"
  end

  # Homebrew requires tests.
  test do
    assert_match "agilescan version 1.0.0", shell_output("#{bin}/infosec-agent -v", 2)
  end
end
