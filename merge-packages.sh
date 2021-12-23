#!/usr/bin/env bash
# merge packages into main repository
# to cleanup. run update.sh to clone and download termux packages repository to it's latest
set -e

cd $(dirname "$(realpath "$0")")

if [ ! -d ./termux-packages/packages ]; then
    echo "Initialize termux-packages submodule repository first before merging all packages"
    exit 2
fi

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "$(basename $0) - Merges packages to Termux packages repository"
    echo ""
    echo "This takes no arguments. this symlinks and merges all packages to main repository including root and x11 ones (whenever possible)"
    echo "To reverse the merging process. run 'cleanup.sh' script to re-clone the Termux packages repository"
    echo
    echo "You can manually merge packages instead of running this script"
    exit
fi

# symlink all packages
for packages in ./packages/*; do
    echo "[*] Merging ${packages} into termux-packages/"
    cp -r ${packages} ./termux-packages/packages/
done
