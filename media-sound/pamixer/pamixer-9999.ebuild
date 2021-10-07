# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Pulseaudio command line mixer."
HOMEPAGE="https://github.com/cdemoulins/pamixer"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cdemoulins/pamixer"
else
	SRC_URI="https://github.com/cdemoulins/pamixer/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
CXXFLAGS="${CXXFLAGS} "

RDEPEND="
	dev-libs/boost
	media-sound/pulseaudio[alsa]"

DEPEND="${RDEPEND}"

src_configure() {
	append-cxxflags \
		-DVERSION=$(git describe --abbrev=4 --dirty --always --tags)
}

src_install() {
	dobin ${PN}
	dodoc README.rst
}
