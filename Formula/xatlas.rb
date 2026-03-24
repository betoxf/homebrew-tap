class Xatlas < Formula
  desc "xatlas CLE runtime and pairing CLI"
  homepage "https://github.com/betoxf/xatlas"
  url "https://github.com/betoxf/xatlas/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b2df6c9bed4be0c38f18f8790601895682c72e638db425ef407f25fea63f9109"
  version "0.2.0"
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
