class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.5/gait_1.3.5_darwin_arm64.tar.gz"
      sha256 "1818743ef2c4d5112c3d8b1293517b51c19f57cce1eff520d2616ee72621fd4e"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.5/gait_1.3.5_darwin_amd64.tar.gz"
      sha256 "e07728089769867b84d9ccbadca64522fdeabeadadb08be44a23a64539a51935"
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
