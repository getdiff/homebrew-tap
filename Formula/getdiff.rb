class Getdiff < Formula
  desc "Capture and upload agentic coding sessions to Diff"
  homepage "https://getdiff.now"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-apple-darwin.tar.gz"
      sha256 "40b1be87bbee3e1fa215943c8a1f2e3f8f9da1a7c07204bc6e36d0a163df8eec"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-apple-darwin.tar.gz"
      sha256 "072616dba78d20556f0957109306d1653459fea2921b7459b82a4bfc297318b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9c94b69fdf3afaa1e886544c4c9f41de568d99d44890becbf9e1a9fedfb9e42"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb27a7387abd46c5e9960342b3707e81d9d03baf768ac6fa2879aa1956d16b30"
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
