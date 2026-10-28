class Hours < Formula
  desc "Local-first time tracking CLI"
  homepage "https://hours.sh"
  url "https://registry.npmjs.org/@hours-sh/cli/-/cli-0.0.0-dev.tgz"
  sha256 "51e0d6f94c7ff27b5fe9609c9f75b8846061e14ceb02acb001f317cd626082c7"
  license "UNLICENSED"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/hours"
    generate_completions_from_executable(bin/"hours", "completion")
  end

  test do
    assert_equal "0.0.0-dev", shell_output("#{bin}/hours --version").strip
  end
end
