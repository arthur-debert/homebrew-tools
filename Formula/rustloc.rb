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

class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.18.0/rustloc-aarch64-apple-darwin.tar.gz"
      sha256 "ccb20da24aa30cc8078525d26bde4ba0bb9dfd474404f9f5082a6a226f834346"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.18.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35e817fa43b82cbb0f1302cbb837f94091d269399d0da7db3c5c23d0ee7a2142"
    end
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.18.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd64cda5b9fe40e08926fada3ec9bf3da3a26731ff2900a0ca2d2d05d2d0f6a5"
    end
  end

  def install
    # The tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/rustloc"].find { |path| File.file?(path) } ||
                 (File.exist?("rustloc") ? "rustloc" : nil)
    raise "Could not find rustloc in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustloc --version")
  end
end
