class Dotcat < Formula
  include Language::Python::Virtualenv
  desc "Cat structured data, in style"
  homepage "https://github.com/arthur-debert/dotcat"
  url "https://files.pythonhosted.org/packages/5e/c5/197b9769c5d00f4ec3e85cefb9a7c1945e7eb61a17b6c76bf632a3c5150d/dotcat-0.8.22.tar.gz"
  sha256 "bd07ad2d02b6aa36f300d307953c36a65f625b8a630799e387042162f82e124f"
  depends_on "poetry"
  depends_on "python@3.9"

  def install
    python3_executable = Formula["python@3.9"].opt_bin / "python3.9"
    python3_version = `#{python3_executable} --version`.strip[1]

    if python3_version.blank? || python3_version < "3.9"
      odie "Python 3.9 or newer is required." # Error if Python < 3.9
    end

    poetry_executable = `which poetry`.strip

    ENV["POETRY_HOME"] = libexec
    system poetry_executable, "env", "use", python3_executable
    system poetry_executable, "install", "--no-dev"

    (bin / "dotcat").write <<~EOS
      #!/bin/bash
      exec "#{poetry_executable}" run dotcat "$@"
    EOS
  end

  test do
    assert_match "Usage: dotcat", shell_output("#{bin}/dotcat --help")
  end
end
