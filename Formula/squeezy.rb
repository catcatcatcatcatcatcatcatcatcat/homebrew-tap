class Squeezy < Formula
  include Language::Python::Virtualenv

  desc "Minimal Squeezebox player for Lyrion Music Server"
  homepage "https://github.com/catcatcatcatcatcatcatcatcatcat/squeezy"
  url "https://github.com/catcatcatcatcatcatcatcatcatcat/squeezy/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "65ecd0ab4a95979c78a11cca4d76eceea8a6e2a17a179ea58a666871a5801241"
  license "MIT"

  depends_on "python@3.13"
  depends_on "ffmpeg"

  resource "miniaudio" do
    url "https://files.pythonhosted.org/packages/17/68/8a0fd202c6f804070a1623d88f3b0882ab26bcd1a4e2bc684cfdab498a9d/miniaudio-1.61.tar.gz"
    sha256 "4f0da7a46aac1e1b0e3c6faa3423ea89863e1417e839a8aff3d8a18c5fbe6849"
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
