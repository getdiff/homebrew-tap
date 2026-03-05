class Getdiff < Formula
  desc "Capture and upload agentic coding sessions to Diff"
  homepage "https://getdiff.now"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-aarch64-apple-darwin.tar.gz"
      sha256 "748b875cf440b05b1ee7d68ebe99a03c0d428b048f1ad3b59d0bf7b936443483"
    else
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-x86_64-apple-darwin.tar.gz"
      sha256 "d1956e75529e7fcb94936087afab8e0546527e5e7833618e2a555d9ab7095dee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be935a40a1841a8162da58bc0b55b6cdbc70ef61c40597c470d175914b7b9b5b"
    else
      url "https://github.com/getdiff/homebrew-tap/releases/download/v#{version}/getdiff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da34d291f7e379b01ca0b515a2de1bb2745c6480695e34779ceaa987c06a95b1"
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
