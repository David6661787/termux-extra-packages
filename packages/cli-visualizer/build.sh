TERMUX_PKG_HOMEPAGE=https://github.com/dpayne/cli-visualizer
TERMUX_PKG_DESCRIPTION="Command line visualizer."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
TERMUX_PKG_VERSION=1.8
TERMUX_PKG_SRCURL="https://github.com/dpayne/cli-visualizer/archive/refs/tags/v${TERMUX_PKG_VERSION}.zip"
TERMUX_PKG_SHA256=feae8d9b9c5c44bc15df1617a1279162755b9ef43e6c57d9cc01c1e84efb213d
# there is a package vis is a text editor. and is collided with cli-visualizer
TERMUX_PKG_CONFLICTS="vis"
TERMUX_PKG_DEPENDS="cmake, fftw, ncurses, pulseaudio"
