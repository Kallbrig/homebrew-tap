class Cast < Formula
  desc "AI-powered shell command generator using local Ollama models"
  homepage "https://github.com/Kallbrig/cast"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Kallbrig/cast/releases/download/v#{version}/cast_#{version}_darwin_arm64.tar.gz"
      sha256 "61ef68e82e1d8e97357460a4047e75c030804784c66c3310e0b0eb1f49797d5c"
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
