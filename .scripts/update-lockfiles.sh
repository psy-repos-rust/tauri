#!/usr/bin/env sh
# Copyright 2019-2021 Tauri Programme within The Commons Conservancy
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: MIT

declare -a examples=("api" "sidecar" "updater" "resources")
declare -a tooling=("bench" "cli" "webdriver")

for example in "${examples[@]}"
do
   cd examples/$example/src-tauri
   cargo update
   cargo build
   cd ../../..
done

for tooling in "${tooling[@]}"
do
   cd tooling/$tooling
   cargo update
   cargo build
   cd ../..
done

cd tooling/bench/tests
cd cpu_intensive/src-tauri
cargo update
cargo build
cd ../../files_transfer/src-tauri
cargo update
cargo build
cd ../../../../..
