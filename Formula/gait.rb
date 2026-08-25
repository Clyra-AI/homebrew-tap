class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.6.0/gait_1.6.0_darwin_arm64.tar.gz"
      sha256 "0fa29b3f6f0dbc69f168def7cde6fc1179b8b0b9d1d744de693cbec5a1c13d82"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.6.0/gait_1.6.0_darwin_amd64.tar.gz"
      sha256 "45088d3d88a1f0d2b841b6519e0f8e9e1adf7529cc5eda218db7534304c783bb"
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
