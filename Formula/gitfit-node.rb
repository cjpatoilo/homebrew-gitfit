class GitfitNode < Formula
  desc "Node.js dependency for Gitfit"
  homepage "https://cjpatoilo.com/gitfit"
  url "https://github.com/cjpatoilo/gitfit/archive/v0.5.2.zip"
  sha256 "dffd3461f1acc2ab5266fc57892ed97e9c090a23"

  def install
    share.install buildpath/"node"
  end

  # def test
  #   system bin/"node", "version"
  # end
end
