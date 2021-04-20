require "FileUtils"

class Agilescan < Formula
  desc "CLI to deploy Frontend modules"
  homepage "https://github.com/schabiyo/infosec"
  url "https://github.com/schabiyo/infosec/releases/download/v0.1.4/agilescan-darwin-amd64-0.1.4.tar.gz"
  sha256 "c4bb34abd18ef743572c085fcbaf0a4d5c0770a7c889ae5ce422213bb35e80d4"
  head "https://github.com/schabiyo/infosec.git"

  def install
    bin.install "agilescan"
  end

  # Homebrew requires tests.
  test do
    assert_match "agilescan version 1.0.0", shell_output("#{bin}/infosec-agent -v", 2)
  end
end
