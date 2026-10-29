class Hours < Formula
  desc "Local-first time tracking CLI"
  homepage "https://hours.sh"
  url "https://registry.npmjs.org/@hours-sh/cli/-/cli-0.2.0.tgz"
  sha256 "51d40f3027fb31f15c857eee322f995d53e204741348815291e337538cd4b6e1"
  license "UNLICENSED"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/hours"
    generate_completions_from_executable(bin/"hours", "completion")
  end

  test do
    assert_equal "0.2.0", shell_output("#{bin}/hours --version").strip
  end
end
