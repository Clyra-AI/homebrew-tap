class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.7.1/gait_1.7.1_darwin_arm64.tar.gz"
      sha256 "e8a1cb82e83ead4d2765c47fbbc4cac5b2b64589bf5ebb1886ff26d28e727466"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.7.1/gait_1.7.1_darwin_amd64.tar.gz"
      sha256 "f0638736818fff1731798fe4f1a737b55ccbeddaa6b8e48bb07fa1650963eff4"
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
