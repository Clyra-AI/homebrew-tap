class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.5.0/gait_1.5.0_darwin_arm64.tar.gz"
      sha256 "de75dd38d73f9a81dee5c24c637a3750e69463ebf71f902efbb5b03779c42410"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.5.0/gait_1.5.0_darwin_amd64.tar.gz"
      sha256 "5abd5314ac15bf3b033cd9333724842a344e10b06ae5912d5678078ac6449cd5"
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
