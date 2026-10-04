#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DPlugin.SymbolResolver=OFF -DDOBBY_DEBUG=OFF
cmake --build build --target dobby_static -j2
c++ -O2 -mbranch-protection=pac-ret+bti -I include tests/linux-arm64-hook-smoke.cpp build/libdobby.a -ldl -o build/hook-smoke
build/hook-smoke
