TERMUX_PKG_HOMEPAGE=https://github.com/dpayne/cli-visualizer
TERMUX_PKG_DESCRIPTION="Command line visualizer."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
_GIT_LATEST_COMMIT=f555bf
TERMUX_PKG_VERSION=${_GIT_LATEST_COMMIT}
TERMUX_PKG_SRCURL="https://github.com/dpayne/cli-visualizer/archive/${TERMUX_PKG_VERSION}.zip"
TERMUX_PKG_SHA256=631bad6d85c2bf15dff07396172a586b9f89684226528387fe3c0b1ab702b6f1
# there is a package vis is a text editor. and is collided with cli-visualizer
TERMUX_PKG_CONFLICTS="vis"
TERMUX_PKG_DEPENDS="cmake, fftw, ncurses, pulseaudio"
# the Makefile-based compilation since 1.8 is deprecated
TERMUX_PKG_FORCE_CMAKE=true

termux_step_pre_configure(){
	sed -i 's/-march=x86-64//g' $TERMUX_PKG_SRCDIR/CMakeLists.txt
	sed -i 's/-march=${VIS_COMPILER_ARCH}//g' $TERMUX_PKG_SRCDIR/CMakeLists.txt
}
