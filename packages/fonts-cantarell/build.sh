TERMUX_PKG_HOMEPAGE="https://wiki.gnome.org/Projects/CantarellFonts"
TERMUX_PKG_DESCRIPTION="Cantarell fonts"
TERMUX_PKG_LICENSE="Openfont-1.1"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
TERMUX_PKG_VERSION="0.111-3"
TERMUX_PKG_PLATFORM_INDEPENDENT=true

# we only get the deb package from debian.org
# such dependencies to generate fonts is missing. specially on device builds
termux_step_post_get_source(){
	curl http://ftp.debian.org/debian/pool/main/f/fonts-cantarell/fonts-cantarell_${TERMUX_PKG_VERSION}_all.deb \
		-o sources.deb

	# extract deb package and re-pack it
	ar x sources.deb

	# maybe messy but get the fonts
	# since it's cached anyway
	mkdir cache
	tar -xf data.tar.xz -C cache
}

termux_step_make_install(){
	install -Dm600 ./cache/usr/share/fonts/opentype \
		$TERMUX_PREFIX/share/fonts
}
