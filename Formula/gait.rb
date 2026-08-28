class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.7.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.7.2/gait_1.7.2_darwin_arm64.tar.gz"
      sha256 "1a49c4a0c178200a126ab30b7517304daa5e4a85ab32994381b6737050377a1e"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.7.2/gait_1.7.2_darwin_amd64.tar.gz"
      sha256 "180733b1cb25cb5b74f687f75fd6a3ed6f148c4fd0545f669fdd88e530f07a0e"
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
