class Wwkg < Formula
  desc "World Wide Knowledge Graph — peer-to-peer graph database"
  homepage "https://wwkg.io"
  version "0.11.0.207"
  license "Proprietary"

  on_macos do
    # Apple Silicon only — Intel Macs use Rosetta 2
    url "https://releases.wwkg.io/builds/0.11.0.207/wwkg-0.11.0.207-darwin-aarch64.tar.gz"
    sha256 "f94146fff76bd6244d3f0462101f1c4536fd95454f1fab641255bcb977dbdf67"
  end

  on_linux do
    on_intel do
      url "https://releases.wwkg.io/builds/0.11.0.207/wwkg-0.11.0.207-linux-x86_64.tar.gz"
      sha256 "ee41236d34b8ae8b7121c1c9eceeca909a47a5f4d910a57518a3aabdc68b725e"
    end
    on_arm do
      url "https://releases.wwkg.io/builds/0.11.0.207/wwkg-0.11.0.207-linux-aarch64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "wwkg"
    bin.install "wwkg-node"
    bin.install "wwkg-gateway"
  end

  def post_install
    system bin/"wwkg", "install", "--all", "--user", "--no-start"
  end

  def caveats
    <<~EOS
      To start the WWKG node and gateway:
        wwkg node start
        wwkg gateway start
    EOS
  end

  test do
    assert_match "WWKG", shell_output("#{bin}/wwkg --help")
    assert_match version.to_s.split(".")[0..2].join("."),
                 shell_output("#{bin}/wwkg-node version")
    assert_match version.to_s.split(".")[0..2].join("."),
                 shell_output("#{bin}/wwkg-gateway version")
  end
end
