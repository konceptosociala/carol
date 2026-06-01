#!/usr/bin/env bash

meson setup build --wipe
meson compile -C build
./build/carol
