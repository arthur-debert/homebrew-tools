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


class Rustloc < Formula
  desc "Rust-aware LOC counter that separates production code from tests — even in the"
  homepage "https://github.com/arthur-debert/rustloc"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.17.2/rustloc-aarch64-apple-darwin.tar.gz"
      sha256 "13617eeca2d94ca97e2542f80e79d8bebc3546875480414de04862d6ec9e05ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.17.2/rustloc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4c98735d39914d0d153a08464ad3886d83021d90d7ae8b125e07bf2d9a65cfd"
    end
    on_arm do
      url "https://github.com/arthur-debert/rustloc/releases/download/v0.17.2/rustloc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97d2abe11966723d562e61de239f92a9faf673deeb54e6738e5a6a6f88acf0e7"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
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
