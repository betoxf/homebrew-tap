class Xatlas < Formula
  desc "xatlas CLE runtime and pairing CLI"
  homepage "https://github.com/betoxf/xatlas"
  url "https://github.com/betoxf/xatlas.git",
      using: GitDownloadStrategy,
      revision: "5db8dba03606149c391f196389dbb5f359ba1cf2"
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
