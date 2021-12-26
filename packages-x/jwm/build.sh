TERMUX_PKG_HOMEPAGE=https://joewing.net/projects/jwm/
TERMUX_PKG_DESCRIPTION="Very small lightweight pure X11 window manager with tray and menus"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
TERMUX_PKG_VERSION=2.4.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL="https://github.com/joewing/jwm/releases/download/v${TERMUX_PKG_VERSION}/jwm-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=1449754f693bdfabbe6318803120722cc65197a73d6bf38120090aee18b16040
TERMUX_PKG_DEPENDS="libcairo, libjpeg-turbo, libpng, libxext, libxrender, libxmu, libxinerama, libxpm, pango"
TERMUX_PKG_SUGGESTS="audacious, galculator, netsurf, pcmanfm, xorg-xclock"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_make_install(){
	# install our jwmrc instead of default one
	cp -a $TERMUX_PKG_BUILDER_DIR/jwmrc $TERMUX_PREFIX/etc/system.jwmrc
}
