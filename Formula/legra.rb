class Legra < Formula
  desc "Peer-to-peer knowledge graph platform"
  homepage "https://legra.ai"
  version "0.20.0.9182"
  license "Proprietary"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://releases.legra.ai/builds/0.20.0.9182/legra-0.20.0.9182-darwin-aarch64.tar.gz"
      sha256 "ea23f58f46b8e6c4149cbb1c34cd595622a8c5d401d791e5fcbe14bd5792384b"
    end
  end

  on_linux do
    on_intel do
      url "https://releases.legra.ai/builds/0.20.0.9182/legra-0.20.0.9182-linux-x86_64.tar.gz"
      sha256 "baf417e39db0e9596c10f32559c1b918cabecd4a9c56f44d8b462a87f4bd8d6f"
    end
    on_arm do
      url "https://releases.legra.ai/builds/0.20.0.9182/legra-0.20.0.9182-linux-aarch64.tar.gz"
      sha256 "d9a3f9d950eb771cc56e3575404bb426719a95e76db5f748eca68bca975ac666"
    end
  end

  def install
    bin.install "legra"
    bin.install "legra-host"
    bin.install "legra-gateway"
    bin.install "legra-custodian"
    bin.install "legra-worker"
    bin.install "legra-licensor"
  end

  def caveats
    <<~EOS
      To install and start Legra's per-user services:
        legra install --all --user
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/legra --version")
    %w[legra-host legra-gateway legra-custodian legra-worker legra-licensor].each do |executable|
      assert_predicate bin/executable, :executable?
    end
  end
end
