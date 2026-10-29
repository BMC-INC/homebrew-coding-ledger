# Coding Ledger for Homebrew

Install the published [Coding Ledger](https://github.com/BMC-INC/coding-ledger)
CLI on macOS. Coding Ledger turns local Git and coding-assistant activity into
reports about work, AI usage, and shipped outcomes.

This repository is the distribution tap. Application source, documentation,
feature requests, and the test suite live in the
[main repository](https://github.com/BMC-INC/coding-ledger).

## Install

Requires [Homebrew](https://brew.sh) on macOS. Homebrew installs Python 3.12
as a dependency.

```bash
brew tap BMC-INC/coding-ledger
brew install BMC-INC/coding-ledger/coding-ledger
coding-ledger --help
```

Then initialize your ledger and scan an explicit project folder:

```bash
coding-ledger init --author "Your Name,you@example.com"
coding-ledger scan --roots "$HOME/Projects" --sources git,claude,codex
coding-ledger dashboard --open
```

Read the [application guide](https://github.com/BMC-INC/coding-ledger#readme)
for privacy, source coverage, attribution limits, and Pro features.

## Release and updates

The formula installs **v1.0.0** from the public GitHub release archive and verifies
it with a SHA-256 checksum. It includes the release's bundled dashboard chart
asset. It does not track unreleased changes on the main branch.

```bash
brew update
brew upgrade BMC-INC/coding-ledger/coding-ledger
```

To uninstall the application:

```bash
brew uninstall coding-ledger
brew untap BMC-INC/coding-ledger
```

Uninstalling does not delete your personal ledger in `~/.coding-ledger/`.

## Maintaining the formula

For each new application release, update the archive URL, version, and SHA-256
in [the formula](Formula/coding-ledger.rb). Verify the downloaded public archive,
then check installation and the CLI:

```bash
brew install --build-from-source BMC-INC/coding-ledger/coding-ledger
brew test BMC-INC/coding-ledger/coding-ledger
```

Report installation issues in [this repository](https://github.com/BMC-INC/homebrew-coding-ledger/issues),
including the macOS and Homebrew versions and the error output. Keep private file
paths, credentials, and ledger contents out of public reports.

## License

Coding Ledger is source-available under
[Elastic License 2.0](https://github.com/BMC-INC/coding-ledger/blob/main/LICENSE),
not OSI open source. This tap does not change the application's license or Pro
licensing requirements.
