class Hours < Formula
  desc "Local-first time tracking CLI"
  homepage "https://hours.sh"
  url "https://registry.npmjs.org/@hours-sh/cli/-/cli-0.2.1.tgz"
  sha256 "acfdc341c0ac8ec8e1189b1d569170ee5bce0370ed422a3b42605e18ca2d4e90"
  license "UNLICENSED"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/hours"
    generate_completions_from_executable(bin/"hours", "completion")
  end

  test do
    assert_equal "0.2.1", shell_output("#{bin}/hours --version").strip
  end
end
