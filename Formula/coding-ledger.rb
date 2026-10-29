class CodingLedger < Formula
  desc "Local-first record of your coding work: hours, attribution, and AI ROI"
  homepage "https://github.com/BMC-INC/coding-ledger"
  url "https://github.com/BMC-INC/coding-ledger/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "33da28ba646c7ffe58c6e5b992d24b975b4dda0f0f1b77a6acb4e128530a9b35"
  version "1.0.1"

  depends_on "python@3.12"

  def install
    libexec.install "coding_ledger.py", "coding_ledger_assets"
    (bin/"coding-ledger").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/coding_ledger.py" "$@"
    EOS
  end

  test do
    assert_match "coding_ledger", shell_output("#{bin}/coding-ledger --help")
    ENV["CODING_LEDGER_DIR"] = testpath/"ledger"
    system bin/"coding-ledger", "init", "--author", "release@example.invalid"
    system bin/"coding-ledger", "dashboard", "--out", testpath/"dashboard.html"
    assert_match "Chart.js", (testpath/"dashboard.html").read
    refute_match "<script src=", (testpath/"dashboard.html").read
  end
end
