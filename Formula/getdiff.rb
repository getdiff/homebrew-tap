class Getdiff < Formula
  desc "Capture and upload agentic coding sessions to Diff"
  homepage "https://getdiff.now"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-apple-darwin.tar.gz"
      sha256 "961841ae7aa27bd72646a188f6f22e678630894b770beeeafb61bfbd0724a2a5"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-apple-darwin.tar.gz"
      sha256 "729c6cae01c999565b7ce3546b3797f0e190fae9fdea8364cede60850c90d138"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b23ceb6444bb43860c3aeaf5b697e6359c06ececb52f15fc76e14c465e47ae98"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1c6f4b638dee3e4c506b2f103951c4cb104c0593c2f56d0f80f549f4e6e0256"
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
