class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.2.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.7/gait_1.2.7_darwin_arm64.tar.gz"
      sha256 "d27c576aa1c0bd0bc1fd2c91f64b1a9dddb656ec507f76dabb75b95d5aa91bba"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.7/gait_1.2.7_darwin_amd64.tar.gz"
      sha256 "bf5e78324aee958b3ac6f9f62502775d2093f404723c78b56d3698b1af1e0919"
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
