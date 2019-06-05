class Gitfit < Formula
  desc "Git Feature Branch Tooling."
  homepage "https://cjpatoilo.com/gitfit"
  url "https://github.com/cjpatoilo/gitfit/archive/v0.5.2.zip"
  sha256 "dffd3461f1acc2ab5266fc57892ed97e9c090a23"
  depends_on "cjpatoilo/gitfit"

  def install
    inreplace "bin/gitfit", /^CLIENT_HOME=/, "export GITFIT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/gitfit", "\"$DIR/node\"", "#{Formula["gitfit-node"].opt_share}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/gitfit"
  end

  def caveats; <<~EOS
    Usage:

      $ gitfit <command> [<options>]

    Options:

      -h, --help              Display help information
      -v, --version           Output version
      init                    Initializy repository
      start                   Start new feature branch
      finish                  Finish feature branch
      publish                 Publish master branch or feature branch

    Examples:

      $ gitfit init
      $ gitfit start <feature-name>
      $ gitfit finish <new-tag> [<main_branch>] # default: master
      $ gitfit publish [<remote-branch>]  # default: current branch
  EOS
  end

  test do
    system bin/"gitfit", "version"
  end
end
