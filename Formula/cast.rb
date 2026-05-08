class Cast < Formula
  desc "AI-powered shell command generator using local Ollama models"
  homepage "https://github.com/Kallbrig/cast"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Kallbrig/cast/releases/download/v#{version}/cast_#{version}_darwin_arm64.tar.gz"
      sha256 "a35c6e5e5dedffc0301e2db9d01c885ec5a91934c77995c402c68ff458a1449d"
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
