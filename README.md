# Legra Homebrew tap

[![Website](https://img.shields.io/badge/website-legra.ai-0a7ea4)](https://legra.ai)
[![Homebrew Tap](https://img.shields.io/badge/homebrew-legra--ai%2Ftap-2e7d32)](https://github.com/legra-ai/homebrew-tap)
[![License: MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](./LICENSE)

Homebrew formulae maintained by Legra.

## Install Legra on macOS

```bash
brew install --cask legra-ai/tap/legra
```

The cask runs Legra's signed macOS package. After administrator authorization,
the package installs the CLI and daemon binaries and automatically registers and
starts the host, gateway, custodian, and worker as system LaunchDaemons. They run
at boot without requiring a user to log in. The licensor binary is included for
operators, but the licensor service is not installed.

## Install dotenvage

```bash
brew install legra-ai/tap/dotenvage
```

## Upgrade

```bash
brew upgrade legra-ai/tap/<formula>
```

## License

This tap repository and its formula code are licensed under MIT. Software
distributed by each formula remains separately licensed.
