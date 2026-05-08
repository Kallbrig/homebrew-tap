class Cast < Formula
  desc "AI-powered shell command generator using local Ollama models"
  homepage "https://github.com/Kallbrig/cast"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Kallbrig/cast/releases/download/v#{version}/cast_#{version}_darwin_arm64.tar.gz"
      sha256 "e5c0644ba69c44df630e8887247ece8a292898ac5f1c0c5007c2426d669321a7"
    end
  end

  depends_on "ollama"

  def install
    bin.install "cast"
  end

  test do
    output = shell_output("#{bin}/cast 2>&1", 1)
    assert_match "usage", output
  end
end
