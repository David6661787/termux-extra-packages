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
for files in .gitmodules termux-packages; do
    rm -rf ${files}
done

echo "[*] Cloning to Termux packages repository...."
git clone https://github.com/termux/termux-packages

# clone all repositories if this file renamed to update-all.sh
if [ "$(basename $0)" == "update-all.sh" ] || [ "$(basename $0)" == "init-all-repos.sh" ]; then
	echo "[*] Cloning root/x11 packages...."
	git clone https://github.com/termux/x11-packages
	git clone https://github.com/termux/termux-root-packages

	for repos in x11-packages termux-root-packages; do
		rm -rf ${repos}/.git
	done
fi

# remove .git directory to remove entanglements
rm -rf ./termux-packages/.git
