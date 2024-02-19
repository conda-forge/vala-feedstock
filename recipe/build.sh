#!/bin/bash

set -exuo pipefail

VALAC=/no-valac ./configure --prefix=${PREFIX} || (cat config.log; exit 1)
make -j${CPU_COUNT}
make install

if [[ "${target_platform}" == "linux-64" ]]; then
  # The test script fails on osx-64 due to a too old bash
  make check
fi
