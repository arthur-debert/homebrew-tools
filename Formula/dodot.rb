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

class Dodot < Formula
  desc "Dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v2.0.0/dodot-aarch64-apple-darwin.gz"
      sha256 "d45e67403d4c333cf95631803239b8539c3f55bbaa9fdc5cbeff1254e3068a7c"
    end
  end

  on_linux do
    on_intel do
      url "{{URL_X86_64_LINUX_GNU}}"
      sha256 "{{SHA_X86_64_LINUX_GNU}}"
    end
    on_arm do
      url "{{URL_AARCH64_LINUX_GNU}}"
      sha256 "{{SHA_AARCH64_LINUX_GNU}}"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/dodot"].find { |path| File.file?(path) } ||
                 (File.exist?("dodot") ? "dodot" : nil)
    raise "Could not find dodot in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dodot --version")
  end
end
