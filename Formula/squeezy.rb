class Squeezy < Formula
  include Language::Python::Virtualenv

  desc "Minimal Squeezebox player for Lyrion Music Server"
  homepage "https://github.com/catcatcatcatcatcatcatcatcatcat/squeezy"
  url "https://github.com/catcatcatcatcatcatcatcatcatcat/squeezy/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "377e6b1fc50c4889af7feecc482f16179d0e10babbc96fc58510ed471d0160ef"
  license "MIT"

  depends_on "python@3.13"
  depends_on "ffmpeg"

  resource "miniaudio" do
    url "https://files.pythonhosted.org/packages/55/fa/96d4cc7ada283357117f7890418ac065a0a6d81ec59e681cd965a403aba3/miniaudio-1.61.tar.gz"
    sha256 "e88e97837d031f0fb6982394218b6487de02eaa382ad273b8fca37791a2b4b15"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage:", shell_output("#{bin}/squeezy --help")
  end
end
