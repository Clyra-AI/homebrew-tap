class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/Clyra-AI/gait"
  version "1.2.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.10/gait_1.2.10_darwin_arm64.tar.gz"
      sha256 "411ce719d3f3d93243ddc3f7e20cae4a67812779b0b6617265eed92f155cdc4b"
    else
      url "https://github.com/Clyra-AI/gait/releases/download/v1.2.10/gait_1.2.10_darwin_amd64.tar.gz"
      sha256 "b0367c0c351811bb34d79cfd719bc8228ea85eb335b9fdd2b77fe2d389de27c4"
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
