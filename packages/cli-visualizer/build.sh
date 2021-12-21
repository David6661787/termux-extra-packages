TERMUX_PKG_HOMEPAGE=https://github.com/dpayne/cli-visualizer
TERMUX_PKG_DESCRIPTION="Command line visualizer."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
TERMUX_PKG_VERSION=1.7
TERMUX_PKG_SRCURL="https://github.com/dpayne/cli-visualizer/archive/refs/tags/v${TERMUX_PKG_VERSION}.zip"
TERMUX_PKG_SHA256=5411f3a7baed7983fd9b4cfb52a224a91038d331d4d28bac718401d12d6830d8
# there is a package vis is a text editor. and is collided with cli-visualizer
TERMUX_PKG_CONFLICTS="vis"
TERMUX_PKG_DEPENDS="cmake, fftw3, ncurses, pulseaudio"
