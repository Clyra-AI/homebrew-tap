class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.2.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.8/gait_1.2.8_darwin_arm64.tar.gz"
      sha256 "234800c34e6dc668b1b9dbf8b5ea54664bf4d1f98bfcb7577bae1e287d4a687b"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.8/gait_1.2.8_darwin_amd64.tar.gz"
      sha256 "cd822f461fac10bdec96a7aa9451042cea589353a1cfb65c3c7188586636050e"
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
