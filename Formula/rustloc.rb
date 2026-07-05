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
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.19.1/rustloc-aarch64-apple-darwin.tar.gz"
      sha256 "b01011dbc201b14e301fdcc48e77084d936299d9d5dc4a2d9b3bfc14acae13ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.19.1/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ae5ab7e8bfb5accf5e54f9e2cf2178ef0c73598cceb9b9d926700cafe063b72"
    end
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.19.1/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa6a502589d66e914c16ebab234bfe5e56bc892f15a21730b79f48f803408bef"
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
