class Dotenvage < Formula
  desc "Dotenv with age encryption: encrypt/decrypt secrets in .env files"
  homepage "https://github.com/dataroadinc/dotenvage"
  version "0.7.1"
  license "CC-BY-SA-4.0"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/dataroadinc/dotenvage/releases/download/v0.7.1/dotenvage-aarch64-apple-darwin.zip"
      sha256 "9390c7bcde5a07bc37338281e21d4a99cdea1b23f2bf021e82a0eec02afbb74e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dataroadinc/dotenvage/releases/download/v0.7.1/dotenvage-aarch64-unknown-linux-gnu.zip"
      sha256 "cf29b5de4bbca74bf750f67be0e0722bc2f6b3cedce8824d66cced0f3b4a234c"
    end
    on_intel do
      url "https://github.com/dataroadinc/dotenvage/releases/download/v0.7.1/dotenvage-x86_64-unknown-linux-gnu.zip"
      sha256 "ed812eddf00503ee5171913836869a26297b67c80163190f839f366b428939a6"
    end
  end

  def install
    bin.install "dotenvage"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotenvage --version")
  end
end
