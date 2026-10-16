#!/usr/bin/env zsh

set -e
export WORKFLOW_ROOT=/Users/runner/work/iBoot64Patcher/iBoot64Patcher/.github/workflows
export DEP_ROOT=/Users/runner/work/iBoot64Patcher/iBoot64Patcher/dep_root
export BASE=/Users/runner/work/iBoot64Patcher/iBoot64Patcher/

cd ${WORKFLOW_ROOT}
curl -sO -k https://cdn.cryptiiiic.com/bootstrap/bootstrap_x86_64.tar.zst &
curl -sO -k https://cdn.cryptiiiic.com/deps/static/macOS/x86_64/macOS_x86_64_1300_1720751343_Release.tar.zst &
curl -sO -k https://cdn.cryptiiiic.com/deps/static/macOS/arm64/macOS_arm64_1700_1720751343_Release.tar.zst &
curl -sO -k https://cdn.cryptiiiic.com/deps/static/macOS/x86_64/macOS_x86_64_1300_1720751343_Debug.tar.zst &
curl -sO -k https://cdn.cryptiiiic.com/deps/static/macOS/arm64/macOS_arm64_1700_1720751343_Debug.tar.zst &
wait
sudo gtar xf ${WORKFLOW_ROOT}/bootstrap_x86_64.tar.zst -C / --warning=none || true || true &
echo "${PROCURSUS}/bin" | sudo tee /etc/paths1
echo "${PROCURSUS}/libexec/gnubin" | sudo tee /etc/paths1
cat /etc/paths | sudo tee -a /etc/paths1
sudo mv /etc/paths{1,}
wait
rm -rf ${DEP_ROOT}/{lib,include} || true
mkdir -p ${DEP_ROOT}/macOS_x86_64_Release ${DEP_ROOT}/macOS_x86_64_Debug ${DEP_ROOT}/macOS_arm64_Release ${DEP_ROOT}/macOS_arm64_Debug
gtar xf macOS_x86_64_1300_1720751343_Release.tar.zst -C ${DEP_ROOT}/macOS_x86_64_Release &
gtar xf macOS_x86_64_1300_1720751343_Debug.tar.zst -C ${DEP_ROOT}/macOS_x86_64_Debug &
gtar xf macOS_arm64_1700_1720751343_Release.tar.zst -C ${DEP_ROOT}/macOS_arm64_Release &
gtar xf macOS_arm64_1700_1720751343_Debug.tar.zst -C ${DEP_ROOT}/macOS_arm64_Debug &
wait
sudo mv /usr/local/bin{,1}
