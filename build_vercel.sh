#!/bin/bash
set -e

git clone https://github.com/flutter/flutter.git --depth 1 -b stable
export PATH="$PATH:$(pwd)/flutter/bin"
flutter config --enable-web
flutter --version
flutter pub get
flutter build web --release --no-tree-shake-icons --web-renderer html
