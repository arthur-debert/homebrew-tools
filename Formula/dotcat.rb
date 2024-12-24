class Dotcat < Formula
  include Language::Python::Virtualenv
  desc "Cat structured data, in style"
  homepage "https://github.com/arthur-debert/dotcat"
  url "https://files.pythonhosted.org/packages/bb/df/da55c2246fa8d31206ddfc9910598a9226c89c02d8d7bc20d57996eb206d/dotcat-0.8.18.tar.gz"
  sha256 "5f845258c1cfd55b423756b50d54103140978223497126997e9fe7fe14de3afb"
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
