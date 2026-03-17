class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.3.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.4/gait_1.3.4_darwin_arm64.tar.gz"
      sha256 "701a48905c76cbe915d56cbfc87030ec4377189c2bc21e842be4f9f2779716b5"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.4/gait_1.3.4_darwin_amd64.tar.gz"
      sha256 "f8ad27a89fc91a24fbbe29b1436822c57f3eb717c2f426e93449a63859a45a98"
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
