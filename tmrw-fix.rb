class TmrwFix < Formula
  desc "TMRW-FIX is a tool designed to help developers manage and track upcoming code changes. When you know you'll need to make changes to certain parts of code tomorrow but want to commit your current work today, you can mark these spots with `tmrw-fix` comments."
  homepage "https://github.com/bartekwitczak/tmrw-fix"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bartekwitczak/tmrw-fix/releases/download/v#{version}/tmrw-fix-darwin-arm64.tar.gz"
      sha256 "92991497533030755ba73f6347dd6bc4d1e92ce6bf3d3da723f9bf7751c90d0f"
    else
      url "https://github.com/bartekwitczak/tmrw-fix/releases/download/v#{version}/tmrw-fix-darwin-amd64.tar.gz"
      sha256 "516211e6258bae8cc9b6578d3addc50cac0d8cb1ebd7237130f6dff8733990c7"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tmrw-fix-darwin-arm64" : "tmrw-fix-darwin-amd64"
    bin.install binary_name => "tmrw-fix"
  end

  test do
    system "#{bin}/tmrw-fix", "--version"
  end
end
