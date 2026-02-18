class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.2.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.6/gait_1.2.6_darwin_arm64.tar.gz"
      sha256 "01d37ca43b03c870438d6c778d387b5f006d3d011c5100d1bf566c6d30bbc407"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.6/gait_1.2.6_darwin_amd64.tar.gz"
      sha256 "2cb92e0d6aac79539c8e6bec543e5531bdff0973514c59a3d9458005768cfe4f"
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
