TERMUX_PKG_HOMEPAGE="https://github.com/pystardust/ytfzf"
TERMUX_PKG_DESCRIPTION="POSIX client for YouTube"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
TERMUX_PKG_VERSION="1.2.0"
TERMUX_PKG_SRCURL="https://github.com/pystardust/ytfzf/archive/refs/tags/v${TERMUX_PKG_VERSION}.zip"
TERMUX_PKG_SHA256=5207303fe67fb8d887c4378febb1617944a66ed4372ac7af815329d5ea67d36b
TERMUX_PKG_DEPENDS="fzf, jq"
# since youtube-dl can't be easily installed. we have to tell users to install it
# in case if a user specified --no-install-recommends we just simply tell users to install it
TERMUX_PKG_RECOMMENDS="python, mpv"
TERMUX_PKG_SUGGESTS="mpv-x"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_pre_configure(){
	sed -i "s|/tmp|$TERMUX_PREFIX/tmp|g" ./ytfzf
}

termux_step_make_install(){
	install -Dm700 -t $TERMUX_PREFIX/bin ./ytfzf

termux_step_create_debscripts(){
	cat >> ./postinst <<- EOT
	# youtube-dl is the primary dependency here
	if command -v pip >/dev/null; then
		pip3 install youtube-dl
	else
		echo "You must install youtube-dl later in order to use this program"
		echo "Run the following if you have python installed:"
		echo
		echo '     pip3 install youtube-dl'
	fi

	# message
	echo
	echo "To play videos, you must install 'mpv-x' in x11-repo"
	EOT
}
