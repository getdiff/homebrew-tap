class Getdiff < Formula
  desc "Capture and upload agentic coding sessions to Diff"
  homepage "https://getdiff.now"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-aarch64-apple-darwin.tar.gz"
      sha256 "564f7faca891476ff7d7d0e372f95ff83f9ec29b75e1c089fa09066599f2c223"
    else
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-x86_64-apple-darwin.tar.gz"
      sha256 "fdc682d6a246ab6e82347e7d88404ecb4ff2721cbd72c1922f245ff11095e9ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9322612e565cc119ed3f700f408d412db46c97045db54235e0a28b1670dee35d"
    else
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84bbcfcfa0a911b1899ab0af055fc5b0ae080180eaeec2851f9f49ef2cc47cd1"
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
