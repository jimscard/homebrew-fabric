class FabricD < Formula
    desc "Fabric-d command-line tools"
    homepage "https://github.com/jimscard/fabric-d"
    url "https://github.com/jimscard/fabric-d/archive/refs/tags/v1.0.tar.gz"
    sha256 "d6f9cbb" # Run: brew fetch --HEAD fabric-d to get the sha256
    license "MIT"
    head "https://github.com/jimscard/fabric-d.git", branch: "main"
    version "1.0"

    livecheck do
        url :stable
        strategy :github_latest
    end

    def install
        # Install all .sh files from the repository
        Dir.glob("*.sh").each do |sh_file|
            # Get basename without extension
            cmd_name = File.basename(sh_file, ".sh")
            # Install executable in bin folder
            bin.install sh_file, cmd_name
        end
    end

    test do
        system "#{bin}/fabric-d", "--help"
    end
end