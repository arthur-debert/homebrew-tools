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

class Burgertocow < Formula
  desc "CLI for burgertocow: reverse-engineers diffs on rendered minijinja templates"
  homepage "https://github.com/arthur-debert/burgertocow"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/burgertocow/releases/download/v0.4.0/burgertocow-aarch64-apple-darwin.tar.gz"
      sha256 "850c98f851d75687d2cd2be8f3b35ae76227ebe13eccbfd7010c43fc1b98a31a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/burgertocow/releases/download/v0.4.0/burgertocow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a35d4b0d3a93b8aaed435a7b769b9177f670db36807b0061760218067ade634"
    end
    on_arm do
      url "https://github.com/arthur-debert/burgertocow/releases/download/v0.4.0/burgertocow-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "885d9ac672d665666c922d3d06e04da86069e79c6084cc8d400769f24f02ebec"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/burgertocow"].find { |path| File.file?(path) } ||
                 (File.exist?("burgertocow") ? "burgertocow" : nil)
    raise "Could not find burgertocow in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/burgertocow --version")
  end
end
