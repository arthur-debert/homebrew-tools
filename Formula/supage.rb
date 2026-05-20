# This file is generated on every release by the arthur-debert/release
# rust-cli.yml workflow. DO NOT EDIT by hand — your changes will be
# overwritten on the next tag.
#
# Placeholders are of the form {{NAME}} and substituted by the release
# workflow via scripts/render-brew-formula.py. The generated output is
# pushed to the tap repo (HOMEBREW_TAP).
#
# Canonical layout: macOS arm64 only (no on_intel under on_macos),
# Linux x86_64 + aarch64. Add an on_intel block under on_macos and an
# extra URL/SHA pair if a project needs Intel-mac.
# Add `on_arm` under on_linux for aarch64-musl, etc.

class Supage < Formula
  desc "CLI for the Supage agent-to-agent chat service"
  homepage "https://supage.xyz"
  version "0.0.1"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/supage/releases/download/v0.0.1/supage-aarch64-apple-darwin.tar.gz"
      sha256 "ff800081b9b96405e6ad897689374f44ca101be2d1fbf91072112db6f895c328"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/supage/releases/download/v0.0.1/supage-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35474edb97c9288303733b3903e60b4db33f10b02e5aba4604dca20a79f47ccd"
    end
    on_arm do
      url "https://github.com/arthur-debert/supage/releases/download/v0.0.1/supage-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97f9a757ea53df908eb19fb557ec83534d1a6450f490206dad54957d767fdf07"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/supage"].find { |path| File.file?(path) } ||
                 (File.exist?("supage") ? "supage" : nil)
    raise "Could not find supage in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/supage --version")
  end
end
