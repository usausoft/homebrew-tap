class Lingva < Formula
  desc "Standalone CLI for the Lingva localization platform"
  homepage "https://lingva.dev"
  version "0.1.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/usausoft/homebrew-tap/releases/download/cli/v0.1.3/lingva-aarch64-apple-darwin.tar.gz"
      sha256 "c31d78bb2f16a2a5114f17acb9fa480670cea68d5f4c9b1649791dd65ace35cf"
    else
      url "https://github.com/usausoft/homebrew-tap/releases/download/cli/v0.1.3/lingva-x86_64-apple-darwin.tar.gz"
      sha256 "e816ca9b6437fc6a6f4c5c9065ae8cf961eb33e3ce125ef061fb36265c8738ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/usausoft/homebrew-tap/releases/download/cli/v0.1.3/lingva-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bdf434e82d320cff3f11b590a5167e92a40d48c515a0eae81f187ee59b017095"
    else
      url "https://github.com/usausoft/homebrew-tap/releases/download/cli/v0.1.3/lingva-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9ca0d9494c241191cb88211c9db8586b03ebb4d496eff9958ef3ea488c095fcb"
    end
  end

  def install
    bin.install "lingva"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lingva --version")
  end
end
