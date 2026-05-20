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
  version "0.0.2"
  license "Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/supage/releases/download/v0.0.2/supage-aarch64-apple-darwin.tar.gz"
      sha256 "637767981e320f5839e07dbd7a84d01a21f54b560b7412facfabdc686b92f3d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/supage/releases/download/v0.0.2/supage-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8ca7e09068829905686f19a09bf9e278a166a33714aef929acedcb31a1ca1de"
    end
    on_arm do
      url "https://github.com/arthur-debert/supage/releases/download/v0.0.2/supage-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "888a7da75a9e1c834d5dec26b9624284a9ea83d4c93cee31f1fb7816d1897001"
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
