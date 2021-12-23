TERMUX_PKG_HOMEPAGE="https://github.com/aristocratos/bashtop"
TERMUX_PKG_DESCRIPTION="Resource monitor that shows usage and stats for processor, memory, disks, network and processes."
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@WMCB-Tech"
TERMUX_PKG_VERSION="0.9.25"
TERMUX_PKG_SRCURL="https://github.com/aristocratos/bashtop/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=676126df13a860df578a3a130783e0abb1c0b7628dddcfd7591069b832e8d8ad
TERMUX_PKG_DEPENDS="bash, coreutils, gawk, procps, sed"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true