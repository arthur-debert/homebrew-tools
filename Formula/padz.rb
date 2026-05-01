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

class Padz < Formula
  desc "Ergonomic, context-aware scratch pad for the terminal — a good Unix citizen"
  homepage "https://github.com/arthur-debert/padz"
  version "1.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/arthur-debert/padz/releases/download/v1.8.2/padz-aarch64-apple-darwin.tar.gz"
      sha256 "43183b79ac9d2e30aac17f23985e17cbc24cea52420011f6f0ab6c7fc54631e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arthur-debert/padz/releases/download/v1.8.2/padz-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "055812436451468ba193415bcca369cb6e28aeb17978f7f113a30c95a1896b4c"
    end
    on_arm do
      url "https://github.com/arthur-debert/padz/releases/download/v1.8.2/padz-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ddd24a651e2afdea4fb62709f9a2046c2fc420ea35eb8a678b0849b3b738e7c"
    end
  end

  def install
    # Canonical tarball layout is <bin_name>/<bin_name> (subdir). Older
    # tarballs may be flat-at-root; the Dir glob covers both shapes so
    # consumers can migrate without breaking installs in flight.
    executable = Dir["*/padz"].find { |path| File.file?(path) } ||
                 (File.exist?("padz") ? "padz" : nil)
    raise "Could not find padz in extracted archive" unless executable

    bin.install executable
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/padz --version")
  end
end
