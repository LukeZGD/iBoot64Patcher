#!/usr/bin/env zsh

set -e
export WORKFLOW_ROOT=/Users/runner/work/iBoot64Patcher/iBoot64Patcher/.github/workflows
export DEP_ROOT=/Users/runner/work/iBoot64Patcher/iBoot64Patcher/dep_root
export BASE=/Users/runner/work/iBoot64Patcher/iBoot64Patcher/

cd ${BASE}
export iBoot64Patcher_VERSION=$(git rev-list --count HEAD | tr -d '\n')
export iBoot64Patcher_VERSION_SHA=$(git rev-parse HEAD | tr -d '\n')
export iBoot64Patcher_VERSION_RELEASE=$(cat version.txt | tr -d '\n')
echo -n $iBoot64Patcher_VERSION_SHA > latest_build_sha.txt
echo -n $iBoot64Patcher_VERSION > latest_build_num.txt
lipo -create -arch x86_64 cmake-build-release-x86_64/iBoot64Patcher -arch arm64 cmake-build-release-arm64/iBoot64Patcher -output iBoot64Patcher
codesign --force --sign - iBoot64Patcher
tar cpPJf "iBoot64Patcher-macOS-${iBoot64Patcher_VERSION_RELEASE}-Build_${iBoot64Patcher_VERSION}-RELEASE.tar.xz" iBoot64Patcher
rm -rf iBoot64Patcher
lipo -create -arch x86_64 cmake-build-debug-x86_64/iBoot64Patcher -arch arm64 cmake-build-debug-arm64/iBoot64Patcher -output iBoot64Patcher
codesign --force --sign - iBoot64Patcher
tar cpPJf "iBoot64Patcher-macOS-${iBoot64Patcher_VERSION_RELEASE}-Build_${iBoot64Patcher_VERSION}-DEBUG.tar.xz" iBoot64Patcher
rm -rf iBoot64Patcher
lipo -create -arch x86_64 cmake-build-asan-x86_64/iBoot64Patcher -arch arm64 cmake-build-asan-arm64/iBoot64Patcher -output iBoot64Patcher
codesign --force --sign - iBoot64Patcher
tar cpPJf "iBoot64Patcher-macOS-${iBoot64Patcher_VERSION_RELEASE}-Build_${iBoot64Patcher_VERSION}-ASAN.tar.xz" iBoot64Patcher
