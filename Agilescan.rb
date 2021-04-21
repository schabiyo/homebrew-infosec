require "FileUtils"

class Agilescan < Formula
  desc "Deploying Agilescan agent"
  homepage "https://github.com/schabiyo/infosec"
  head "https://github.com/schabiyo/infosec.git"

  if !OS.linux?
    url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan_macOs_64bit.zip"
    sha256 "9ee30fc358fae8d248a2d7538957089885da321dca3f09e3296fe2058e7ff74"
    abort(" Sorry Your Os is not supported")
  end
  if OS.linux? && Hardware::CPU.intel?
    puts "Linux and CPU Intel".inspect
    url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan_Linux_64bit.zip"
    sha256 "b41bebd25fd7bb1a67dc2cd5ee12c9f67073094567fdf7b3871f05fd74a45fdd"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    puts "Linux ARM not 64 bit".inspect
    url "https://github.com/schabiyo/infosec/releases/download/v1/agilescan_Linux_armv7.zip"
    sha256 "78f31239430eaaec01df783e2a3443753a8126c325292ed8ddb1658ddd2b401d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    puts "Linux and CPU ARM 64 bits".inspect
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
    system "tree", "--version"
    puts "Completed install"
  end

  def post_install
    etc.install "agilescan.conf"
    # Find a way to start the service
  end

  # Homebrew requires tests.
  test do
    assert_match "agilescan version 1.0.0", shell_output("#{bin}/infosec-agent -v", 2)
  end
end
