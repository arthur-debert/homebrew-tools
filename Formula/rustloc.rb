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
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.19.0/rustloc-aarch64-apple-darwin.tar.gz"
      sha256 "74dd7ee157f526d2194ed900baf047d5342c2d0317fd19c8d6a0c01690dc4c28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.19.0/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29aaf20eb77bee6021c4f93f46137a6b9264c237f7cd9489db4fca988e4c7509"
    end
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.19.0/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "339960e382b2af33c858aa7d21722ba03de606ce26e80e08b4bbcf21b7ee35f4"
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
