class CodingLedger < Formula
  desc "Local-first record of your coding work: hours, attribution, and AI ROI"
  homepage "https://github.com/BMC-INC/coding-ledger"
  url "https://github.com/BMC-INC/coding-ledger/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1ecda9e72acd87777a25f23d6da9c551db81fd48fffac449d75a35de3a9a2f67"
  version "1.0.0"

  depends_on "python@3.12"

  def install
    libexec.install "coding_ledger.py", "vendor"
    (bin/"coding-ledger").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/coding_ledger.py" "$@"
    EOS
  end

  test do
    assert_match "coding_ledger", shell_output("#{bin}/coding-ledger --help")
  end
end
