# Linux ARM64 compatibility fixes

This branch repairs Linux build paths in source base `5dfc8546954ce3b3198132ab13fddb89ee92cdd7`:

- Use ELF ARM64 page relocations outside Apple builds instead of Mach-O `@PAGE` / `@PAGEOFF` syntax.
- Update Linux process-map code to the current `MemRange::start()` and `RuntimeModule::base` interfaces, handle failed reads, initialize module paths, and distinguish RWX regions before RW regions.
- Include the current cache-flush interface in POSIX code patching.
- Include `<sys/time.h>` directly for `gettimeofday`.

## Build and smoke test

```sh
cmake -S . -B build \
  -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DPlugin.SymbolResolver=OFF -DDOBBY_DEBUG=OFF
cmake --build build --target dobby_static -j2
g++ -O2 -mbranch-protection=pac-ret+bti -I include \
  tests/linux-arm64-hook-smoke.cpp build/libdobby.a -ldl -o build/hook-smoke
build/hook-smoke
```

The smoke test drives real inline hooks: original integer and floating-point calls, relocated trampolines, and five install/remove cycles. It passed on a MacBook Pro 13-inch M1/J293 running Linux 7.1.13 with 16 KiB pages and GCC 16.1.1. The resulting static library also passed Phantomat navigation, popup, and multi-monitor nested-compositor tests.

`DobbyGetVersion` is declared in this source base's public header but is not supplied by the static build; the test does not rely on it. Existing compiler deprecation/attribute warnings remain non-fatal in the tested build.

These are agent-assisted local compatibility changes published to a personal fork; other architectures/platforms have not been newly verified by this work.
