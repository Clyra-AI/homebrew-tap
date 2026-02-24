class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.0/gait_1.3.0_darwin_arm64.tar.gz"
      sha256 "365416228962d2e7ca537606a3861a46a46b301a8d12764e3c1cf495b99ca5db"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.0/gait_1.3.0_darwin_amd64.tar.gz"
      sha256 "60d53611d2977cfc47199a45bb9d6e842a355ac521c90b21876e3388455caba5"
    end
  end

  def install
    bin.install "gait"
  end

  test do
    output = shell_output("#{bin}/gait demo --json")
    assert_match "\"run_id\"", output
  end
end
