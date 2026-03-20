class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.3.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.7/gait_1.3.7_darwin_arm64.tar.gz"
      sha256 "0d15805a65a7fbafa1c19635e7c2057dc201ffa66b48cf71d22b65805b5c80a2"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.3.7/gait_1.3.7_darwin_amd64.tar.gz"
      sha256 "f348f4add2cc0576c0e71c9f3aa6b5d75b326ec1405e7c7b34ff36868d1ab454"
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
