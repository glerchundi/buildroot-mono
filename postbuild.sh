#!/bin/bash
set -x

[ -n "${TARGET_DIR}" ] || exit

# delete not needed file/folders
cd "${TARGET_DIR}"
rm -rf root/.bash_* home/ftp

# create required folders
mkdir -p etc/mono/registry/LocalMachine
