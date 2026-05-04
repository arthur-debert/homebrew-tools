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
  version "4.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v4.1.0/dodot-aarch64-apple-darwin.tar.gz"
      sha256 "a61f551e3b362664013d26fe20b91ac1f9d58b572b9ccb6df16ac50c3b908074"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v4.1.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0998b42152c3ac3c287c1f89f2b9a444faffb65915c4a553bf5bac9a78a3987f"
    end
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v4.1.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "998b2561053c55c257a3961491a13c862a8394138208ac34950a9349c2337efb"
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
