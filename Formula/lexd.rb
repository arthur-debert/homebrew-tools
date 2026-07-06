# This file is generated on every release by the arthur-debert/release
# rust-cli.yml workflow. DO NOT EDIT by hand — your changes will be
# overwritten on the next tag.
#
# Placeholders are of the form {{NAME}} and substituted by the release
# workflow via scripts/render-brew-formula.py. The generated output is
# pushed to the tap repo (HOMEBREW_TAP).
#
# Layout: macOS arm64 only (no on_intel under on_macos),
# Linux x86_64 + aarch64. Add an on_intel block under on_macos and an
# extra URL/SHA pair if a project needs Intel-mac.
# Add `on_arm` under on_linux for aarch64-musl, etc.

class Lexd < Formula
  desc "Command-line interface for the lex format"
  homepage "https://github.com/lex-fmt/lex"
  version "0.19.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.3/lexd-aarch64-apple-darwin.tar.gz"
      sha256 "64ad3ba7f778415d4210cd380ee3706a2f97765041ed5689afa817141cf36ddc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.3/lexd-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed3adbd89105c49ebec0d89c67db44ce2924600c14fcbf6f1976f9ed858da623"
    end
    on_arm do
      url "https://github.com/lex-fmt/lex/releases/download/v0.19.3/lexd-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de2cc2009ea9c310494d19c4ceb8943178bc4e4bb0f77f90b542d6f5584a13dc"
    end
  end

  def install
    # The tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/lexd"].find { |path| File.file?(path) } ||
                 (File.exist?("lexd") ? "lexd" : nil)
    raise "Could not find lexd in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lexd --version")
  end
end
