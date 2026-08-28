class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.7.0/gait_1.7.0_darwin_arm64.tar.gz"
      sha256 "cf91fbab2ecdee07892b3b8119d6f75af9927ac8b891328e0abb8214e6e49729"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.7.0/gait_1.7.0_darwin_amd64.tar.gz"
      sha256 "708026ecd87ca83da1318ae06af5eaf4e9744ac247ef07b0d0c6387daab1ed30"
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
