class FabricD < Formula
  desc "Fabric-d command-line tools"
  homepage "https://github.com/jimscard/fabric-d"
  url "https://github.com/jimscard/fabric-d/releases/download/v2.0.1/fabric-d-v2.0.1.tar.gz"
  sha256 "3553ce827720ca52a95f096af689f81563c5fe0424fc84a0b09563d0daad7567"
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
