#!/usr/bin/env bash
# re-initiate termux-packages repository
set -e

# check for packages directory
if [ ! -d ./packages ] && [ ! -d ./.git ]; then
    echo "Not in valid repository"
    exit 2
fi

# show help
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "$(basename $0) - Re-initialize termux-packages repository"
    echo
    echo "This takes no arguments. it will re-clone termux-packages repository for updating or start from scratch after merging packages"
    exit
fi

# delete gitmodules and termux-packages repository
for files in .gitmodules termux-packages; do
    rm -rf ${files}
done

echo "[*] Cloning to Termux packages repository...."
git clone https://github.com/termux/termux-packages

# remove .git directory to remove entanglements
rm -rf ./termux-packages/.git
