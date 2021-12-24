# Termux extra packages
The Termux build system containing experimental or personal packages for the use with Termux application bypassing the packaging policies

# Repository Information
This repository is where all packages and build scripts that isn't yet available on Termux repositories

Types of Packages includes:
- Experimental/Unstable packages that is not ready for porting in Termux repos
- Imported packages from Termux packages enabling disabled features in a specific package
- Old versions or outdated packages that is superseeded/replaced with new ones

Packages are categorized in these directories:
- [`disabled-packages`](./disabled-packages) - Contains problematic packages that can't be compiled or successfully be run on Termux
- [`packages`](./packages)- Mostly CLI utilites and libraries as well as assets
- [`packages-x`](./packages-x) - X11 packages


# Building Packages
## On Device
You can locally build on device without using a computer but chances are will pollute your installation thus not recommended. some dependencies on a package don't build

Use VPS or other cloud computing services to build packages in a pristine environment instead

## Computer
We'd recommend to setup a pristine environment such as Termux's build system docker image. or a linux virtual machine

If you have ubuntu/arch. run `termux-packages/scripts/setup-{ubuntu/archlinux}.sh` to setup dependencies as well as `termux-packages/scripts/setup-android-sdk.sh` to install Android SDK/NDK

If you do not use Arch/Ubuntu 20.04 you may use a virtual machine or a docker container instead for better results

## Initializing Repository
Cloning this repository will be small and you can't build packages yet. you must load submodules as well to clone `termux-packages` repository

If you already cloned this repository. run
```
git submodule update --init
```

But if not and just cloning this repository. clone it recursively passing `--recursive` flag

However if you do not wish to use submodules. run `update.sh` script to clone termux-packages repository \
To include x11 packages as well. run `update-all.sh` 

# Building packages
Once initialized. you can build package as
```
./build-package.sh ../packages/package-to-build
```
Note that you must give a absolute path of packages you wish to build. otherwise it won't recognize it

You can also copy all packages to `termux-packages/packages` repository
```
cp -rp ./packages/* ./termux-packages/packages/
```
So you can run `build-package.sh` without specifying absolute path of a package

To build x11 packages, you must first run `update-all.sh` to initiate all dependencies \
afterwards you'll have to copy all packages first in `termux-packages/packages` in order to prevent dependency issues
```
cp -rp ./.repo/x11-packages/packages/* ./termux-packages/packages/
```
Then you can run `./build-package.sh ../packages-x/package-to-build`

## Docker Container
The easiest and pristine method to build packages

Run `start-builder.sh` to prepare the build environment and copies all packages to `termux-packages` repository

or if you want to include and build x11 packages as well. run `update-all.sh` and run `start-builder.sh`

To build package in docker container. run
```
./build-package.sh <package-to-build>
```

# Contributing
If adding packages here, requirements as follows:
- Packaging related to hacking/phishing/OSINT are not allowed here!
- Build scripts must have tab size 8, no executable permission, UTF-8 encoding [(coding guideline)](https://github.com/termux/termux-packages/wiki/Coding-guideline)
- Useful for everyone
