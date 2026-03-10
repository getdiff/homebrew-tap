class Getdiff < Formula
  desc "Capture and upload agentic coding sessions to Diff"
  homepage "https://getdiff.now"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-aarch64-apple-darwin.tar.gz"
      sha256 "8a377d2cfffaf289744dd849987260bb444d26af3f36f75702780e7cd6f209e6"
    else
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-x86_64-apple-darwin.tar.gz"
      sha256 "6bdacf6624897daab4e4bfbaee48e613d926826594dc9cded6ed0152bfe64a5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55d87952a3cd4195e21f5844056ad8e551fa5a8dcd9e9381dccfde431b4f810b"
    else
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a0a59440f25a3c8881a6f507724d8fcc7f40fccd2531e439898841cd52620a4"
    end
  end

  def install
    bin.install "getdiff"
  end

  service do
    run [opt_bin/"getdiff", "watch"]
    keep_alive true
    log_path var/"log/getdiff.log"
    error_log_path var/"log/getdiff.log"
    working_dir HOMEBREW_PREFIX
  end

  test do
    assert_match "getdiff", shell_output("#{bin}/getdiff --version")
  end
end
