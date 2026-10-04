# Dobby Linux ARM64 contribution fork

[![CI](https://github.com/Connorbelez/Dobby/actions/workflows/ci.yml/badge.svg)](https://github.com/Connorbelez/Dobby/actions/workflows/ci.yml)

This is Connor Beleznay's unofficial compatibility fork of [jmpews/Dobby](https://github.com/jmpews/Dobby). The preferred outcome is focused upstream contributions, followed by retirement of the compatibility delta. No independent stable distribution is promised.

The historical compatibility branch remains available. `main` includes maintenance setup. Original M1 test evidence applies to the documented compatibility revision; changes on `main` need fresh qualification. See [ARM64 notes](docs/linux-arm64.md), [roadmap](ROADMAP.md), and [attribution](ATTRIBUTION.md).

CI verifies a native Linux ARM64 static build and real hook smoke test. GitHub's ARM64 runner uses its own page size and does not reproduce the M1's 16 KiB-page result.

---

## Dobby

[![Contact me Telegram](https://img.shields.io/badge/Contact%20me-Telegram-blue.svg)](https://t.me/IOFramebuffer) [![Join group Telegram](https://img.shields.io/badge/Join%20group-Telegram-brightgreen.svg)](https://t.me/dobby_group)

Dobby a lightweight, multi-platform, multi-architecture exploit hook framework.

- Minimal and modular library
- Multi-platform support(Windows/macOS/iOS/Android/Linux)
- Multiple architecture support(X86, X86-64, ARM, ARM64)

## Compile

[docs/compile.md](docs/compile.md)

## Download

[download latest library](https://github.com/jmpews/Dobby/releases/tag/latest)

## Credits

1. [frida-gum](https://github.com/frida/frida-gum)
2. [minhook](https://github.com/TsudaKageyu/minhook)
3. [substrate](https://github.com/jevinskie/substrate).
4. [v8](https://github.com/v8/v8)
5. [dart](https://github.com/dart-lang/sdk)
6. [vixl](https://git.linaro.org/arm/vixl.git)

## Maintenance backlog

The [GitHub Project](https://github.com/users/Connorbelez/projects/18) tracks the roadmap issues and release qualification. See [maintenance](MAINTAINERS.md) for ownership and review expectations.
