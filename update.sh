#!/usr/bin/env bash
# re-initiate termux-packages repository
set -e

cd $(dirname "$(realpath "$0")")

# show help
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "$(basename $0) - Re-initialize termux-packages repository"
    echo
    echo "This takes no arguments. it will re-clone termux-packages repository for updating or start from scratch after merging packages"
    exit
fi

# delete gitmodules and termux-packages repository
rm -rf .gitmodules
rm -rf termux-packages

echo "[*] Cloning to Termux packages repository...."
git clone https://github.com/termux/termux-packages

# remove .git directory to remove entanglements
rm -rf ./termux-packages/.git

# include all repositories if the filename is 'update-all.sh'
if [ "$(basename $0)" == "update-all.sh" ]; then
    echo "[*] Cloning X11 repository..."
    git clone https://github.com/termux/x11-packages .repo/x11-packages

    rm -rf .repo/x11-packages/.git
fi
