class Lingva < Formula
  desc "Standalone CLI for the Lingva localization platform"
  homepage "https://lingva.dev"
  version "0.1.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://unpkg.com/@lingva/cli@0.1.5/assets/lingva-aarch64-apple-darwin.tar.gz"
      sha256 "c7f618b876de0497f6857c68168f271e78f524dc3ce869db7e62a156f5790c0e"
    else
      url "https://unpkg.com/@lingva/cli@0.1.5/assets/lingva-x86_64-apple-darwin.tar.gz"
      sha256 "049d99fafd6a15032d5bc78507bd6db58601fe3af8193c49fe6492126a7002a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://unpkg.com/@lingva/cli@0.1.5/assets/lingva-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4faff8a4113356654189e1cb8a3d034b37fff6f93730ffd537e38b9c5072e29"
    else
      url "https://unpkg.com/@lingva/cli@0.1.5/assets/lingva-x86_64-unknown-linux-musl.tar.gz"
      sha256 "47a10c2a624e34746d0fd54e03fb17535c5ea1ae7467bddaf2411a65e137b1ec"
    end
  end

  def install
    bin.install "lingva"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lingva --version")
  end
end
