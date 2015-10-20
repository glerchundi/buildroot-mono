#!/bin/bash
set -x

[ -n "${TARGET_DIR}" ] || exit

# fix issue with absolute paths, until something more is done with this:
# http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/129991
find ${TARGET_DIR}/etc/mono -type f -print0 | xargs -0 sed -i 's/\/home\/travis\/buildroot\/output\/host//g'
find ${TARGET_DIR}/usr/lib/mono -type f -print0 | xargs -0 sed -i 's/\/home\/travis\/buildroot\/output\/host//g'

# delete not needed file/folders
cd "${TARGET_DIR}"
rm -rf root/.bash_* home/ftp

# create required folders
mkdir -p etc/mono/registry/LocalMachine
