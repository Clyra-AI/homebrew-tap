class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.3.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.6/gait_1.3.6_darwin_arm64.tar.gz"
      sha256 "2004af5c56f0b5bf4b681e43640c10fb3f95ffcb80e1a053194288b12e127660"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.6/gait_1.3.6_darwin_amd64.tar.gz"
      sha256 "8e1d2d594b7f98f6a5bcbd0900ad8df581fb4362792372ac0782abedd7110d07"
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
