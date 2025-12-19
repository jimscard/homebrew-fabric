class FabricD < Formula
  desc "Fabric-d command-line tools"
  homepage "https://github.com/jimscard/fabric-d"
  url "https://github.com/jimscard/fabric-d/archive/refs/tags/v1.1.tar.gz
  sha256 "04cc7ec8c2c966d849fbf7a17111a19e0b94275af942c61427779d9ecc365dbdx"
  license "MIT"
  head "https://github.com/jimscard/fabric-d.git", branch: "main"
  version "1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    # Install all .sh files from the repository
    Dir.glob("*.sh").each do |sh_file|
      # Get basename without extension
      cmd_name = File.basename(sh_file, ".sh")
      # Make the script executable
      chmod 0755, sh_file
      # Install executable in bin folder
      bin.install sh_file => cmd_name
    end
  end

  test do
    system "#{bin}/fabric-d", "--help"
  end
end
