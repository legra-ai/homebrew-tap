cask "legra" do
  version "0.20.0.9182"
  sha256 "097500a2a7ae10c081f969d1792762efcf588190fc1e4e9ccb6bb2364996fdf9"

  url "https://releases.legra.ai/builds/#{version}/legra-#{version}-darwin-aarch64.pkg"
  name "Legra"
  desc "Peer-to-peer knowledge graph platform"
  homepage "https://legra.ai/"

  disable! date: "2026-08-12", because: "the current macOS package is not signed"

  depends_on arch: :arm64
  depends_on :macos

  pkg "legra-#{version}-darwin-aarch64.pkg"

  uninstall script:  {
              executable: "/usr/local/share/legra/uninstall.sh",
              sudo:       true,
            },
            pkgutil: "ai.legra.binaries"
end
