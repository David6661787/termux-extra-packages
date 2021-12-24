TERMUX_PKG_HOMEPAGE=https://ohmyposh.dev/
TERMUX_PKG_DESCRIPTION="A prompt theme engine for any shell"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
TERMUX_PKG_VERSION="6.39.0"
TERMUX_PKG_SRCURL="https://github.com/JanDeDobbeleer/oh-my-posh/archive/refs/tags/v${TERMUX_PKG_VERSION}.zip"
TERMUX_PKG_SHA256=642b0aa2d12eb9b37f734813e25d1c3a232cad80cd398bf66624be6fd310c1a3
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make(){
	termux_setup_golang
	export GOPATH=$TERMUX_PKG_BUILDDIR

	cd src
	go build
}

termux_step_make_install(){
	install -Dm700 -t $TERMUX_PREFIX/bin oh-my-posh
}
