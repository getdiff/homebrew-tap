class Getdiff < Formula
  desc "Capture and upload agentic coding sessions to Diff"
  homepage "https://getdiff.now"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-apple-darwin.tar.gz"
      sha256 "2632ea6cca2089034ae3c381ccffb78f0671a817be88214dc5680b5c95f3491e"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-apple-darwin.tar.gz"
      sha256 "ef03e22a96b89d9d113f484a5fed3ee5cd9aa64e0905eb09ef968718e365cfcf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8f7cf6264cb1d8058c8388a3f846105e27567de7b8fc4a73ef7fc6d1e58fcf2"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5c22295b1e086bf87137d98e57858fb2046a7452a57c872009a9238b9df5e55"
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
