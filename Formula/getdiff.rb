class Getdiff < Formula
  desc "Capture and upload agentic coding sessions to Diff"
  homepage "https://getdiff.now"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-apple-darwin.tar.gz"
      sha256 "522b54851876d6d7fb3840a82a76c28aa2edd72bf963ae9069988bc8505187da"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-apple-darwin.tar.gz"
      sha256 "0952cde6765a442e1276e22f914405c9784def95dbeebd4b98dd19995527a2ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d4fe1b0126508683cfb90f537798b03a38b1b5b9888cab597663e27234f12bb"
    else
      url "https://github.com/getdiff/cli/releases/download/v#{version}/getdiff-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b55948916c98ba4f379962fad6e24680993ad135ef53760061120e258bb937e1"
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
