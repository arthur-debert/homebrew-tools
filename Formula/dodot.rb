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


class Dodot < Formula
  desc "Dotfiles manager that uses symlinks for live editing"
  homepage "https://github.com/arthur-debert/dodot"
  version "5.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.2.0/dodot-aarch64-apple-darwin.tar.gz"
      sha256 "26dddbef42852df9a474b97898f962911ba07c939e2f2ddcd908a39bda4572cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.2.0/dodot-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed65ec882fe03a7ef567085c19cd4b979a3f74da07f9946bed88b1d18f186369"
    end
    on_arm do
      url "https://github.com/arthur-debert/dodot/releases/download/v5.2.0/dodot-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0431ab1b8ae23ae57dc0d29d3d0077b971b5ed2f5b4d11d04a7f76b6b43d9ab"
    end
  end

  def install
    # The tarball layout is <bin_name>/<bin_name> (subdir). Older
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
