#!/bin/bash
set -x

[ -n "${TARGET_DIR}" ] || exit

# move to target folder
cd "${TARGET_DIR}"

# delete not needed file/folders
rm -rf root/.bash_* home/ftp

# fix issue with absolute paths, until something more is done with this:
# http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/129991
find etc/mono -type f -print0 | xargs -0 sed -i 's/\/home\/travis\/buildroot\/output\/host//g'
find usr/lib/mono -type f -print0 | xargs -0 sed -i 's/\/home\/travis\/buildroot\/output\/host//g'

# create required folders
mkdir -p etc/mono/registry/LocalMachine
