class Lingva < Formula
  desc "Standalone CLI for the Lingva localization platform"
  homepage "https://lingva.dev"
  version "0.1.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://unpkg.com/@lingva/cli@0.1.4/assets/lingva-aarch64-apple-darwin.tar.gz"
      sha256 "427bf1609f804e46ca2e4b25ca64a63b465f25df2688dba55ac507e092c78ef6"
    else
      url "https://unpkg.com/@lingva/cli@0.1.4/assets/lingva-x86_64-apple-darwin.tar.gz"
      sha256 "9ad614a0426535fcd497f06c745af5aaafe8783b14c31590a56c7e6180f2af53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://unpkg.com/@lingva/cli@0.1.4/assets/lingva-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c81f0cd10c33da8b7afc119d2e39ed89188142d2052c0250e3267ec0ea0d8ca4"
    else
      url "https://unpkg.com/@lingva/cli@0.1.4/assets/lingva-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea0a8033e580f78ff314d83c74b6656dac600f193e2673fe7b88ed62872aeba1"
    end
  end

  def install
    bin.install "lingva"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lingva --version")
  end
end
