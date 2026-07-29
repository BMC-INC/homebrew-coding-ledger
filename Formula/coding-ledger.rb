class CodingLedger < Formula
  desc "Local-first record of your coding work: hours, attribution, and AI ROI"
  homepage "https://github.com/BMC-INC/coding-ledger"
  url "https://github.com/BMC-INC/coding-ledger/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3c75ae3fd479cfb79889aaba9d62e1f4292d737641c50fc2627e6be244b02130"
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
