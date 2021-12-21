#!/usr/bin/env bash
# merge packages into main repository
# to cleanup. run cleanup.sh to clone and download termux packages repository to it's latest
set -e

if [ ! -d ./termux-packages/packages ]; then
    echo "Initialize termux-packages submodule repository first before merging all packages"
    exit 2
fi

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "$(basename $0) - Merges packages to Termux packages repository"
    echo ""
    echo "This takes no arguments. it will symlink all packages from directory packages/ to termux-packages/packages"
    echo "To reverse the merging process. run 'cleanup.sh' script to re-clone the Termux packages repository"
    exit
fi

# symlink all packages
for packages in ./packages/*; do
    ln -rs ./packages/${packages} ./termux-packages/packages/${packages}
done
