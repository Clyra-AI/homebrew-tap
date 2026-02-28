class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.1/gait_1.3.1_darwin_arm64.tar.gz"
      sha256 "b7db48cf1c1ee8609a32dc232c292c10bcabaa06715482b7be30e3364bfd8ede"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.1/gait_1.3.1_darwin_amd64.tar.gz"
      sha256 "987caceb191460f36221effc260a9bbb8c7bfd29def8f03893958ce740fbdf04"
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
