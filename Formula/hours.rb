class Hours < Formula
  desc "Local-first time tracking CLI"
  homepage "https://hours.sh"
  url "https://registry.npmjs.org/@hours-sh/cli/-/cli-0.0.0-dev.1.tgz"
  sha256 "583cb9d74a4c7ba6d2140ae6bfd6a47a0cd935e68c2013d0049ef1b9f20980c3"
  license "UNLICENSED"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/hours"
    generate_completions_from_executable(bin/"hours", "completion")
  end

  test do
    assert_equal "0.0.0-dev.1", shell_output("#{bin}/hours --version").strip
  end
end
