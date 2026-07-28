#!/usr/bin/env bash
# Rebuilds assets/tailwind.css from src/input.css using the standalone Tailwind CLI.
# Run this after changing any Tailwind classes in index.html or editing src/input.css.
cd "$(dirname "$0")/.."
./build/tailwindcss.exe -i src/input.css -o assets/tailwind.css --minify
