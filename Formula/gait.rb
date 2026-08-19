class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.4.0/gait_1.4.0_darwin_arm64.tar.gz"
      sha256 "4a955e72bfb73dcec2982751dfc07d69f4f3eef8297cf59e1ea26b573de122d4"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.4.0/gait_1.4.0_darwin_amd64.tar.gz"
      sha256 "56ea9e1cfaf7af2f54e7efc571ecba8b7b18a8f388883bd6ae1f81f19bc016fd"
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
