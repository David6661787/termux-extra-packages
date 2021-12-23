# Termux extra packages
The Termux build system containing experimental or personal packages for the use with Termux application bypassing the packaging policies

# Repository Information
Packages contain:
- Alternatives to existing packages
- Experimental/Preview packages that is untested within Termux's packaging quality
- Others by me

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

# Building packages
To build a package. run 
```
./termux-packages/build-package.sh ../packages/package-to-build
```
or
```
./build-package.sh ../packages/package-to-build
```
to build a specified package. `debs` will output somewhere in `termux-packages/output` repo. use `find . -name *.deb` to find them

## Docker Container
A script `start-builder.sh` will let you setup a pristine docker environment (script taken from termux-packages repo), will copy/merge all packages to `termux-packages` repo and you can build normally inside the container as 
`./build-package.sh <package-name-to-build>`

## Merging packages
You can merge packages to `./termux-packages/packages/` so you can simply do `./build-package.sh <package-name-to-build>` without appending leading paths

Copy all packages to `packages/` to `./termux-packages/packages`
```
cp -r ./packages/* ./termux-packages/packages
```
Before you do that you must load `termux-packages` submodule first

# Contributing
If adding packages here, requirements as follows:
- Packaging related to hacking/phishing/OSINT are not allowed here!
- Build scripts must have tab size 8, no executable permission, UTF-8 encoding [(coding guideline)](https://github.com/termux/termux-packages/wiki/Coding-guideline)
- Useful for everyone
