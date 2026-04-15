class Xatlas < Formula
  desc "xatlas CLE runtime and pairing CLI"
  homepage "https://github.com/betoxf/xatlas-cle"
  url "https://github.com/betoxf/xatlas-cle/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "fed2e98d86fa5ea9ededa9329f3fd2b0e1615d219a3669d9a3c6ad21d28b1600"
  version "0.2.1"
  license "ISC"

  depends_on "node"

  def install
    cd "xatlas-bridge" do
      system "npm", "install", *std_npm_args(prefix: libexec)
    end

    bin.install_symlink libexec/"bin/xatlas"
    bin.install_symlink libexec/"bin/xatlas-cle"
    bin.install_symlink libexec/"bin/xatlas-bridge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xatlas --version")
  end
end
