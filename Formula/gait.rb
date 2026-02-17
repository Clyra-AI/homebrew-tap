class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.2.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.4/gait_1.2.4_darwin_arm64.tar.gz"
      sha256 "7ea3f448df0c54567da49988510e2945e1d84d4770a54efa575533f1b050031e"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.4/gait_1.2.4_darwin_amd64.tar.gz"
      sha256 "c30aa4978e3030420f684d155c5920534cca879e8b4a059525c405b64517985f"
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
