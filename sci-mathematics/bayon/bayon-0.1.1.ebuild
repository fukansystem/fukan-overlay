# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="A simple and fast clustering tool"
HOMEPAGE="http://code.google.com/p/bayon/"
GIT_COMMIT="7d429239563973f61e47538f1af31f9ace0cac88"
SRC_URI="https://github.com/fujimizu/bayon/archive/${GIT_COMMIT}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="+sparsehash test"

DEPEND="sparsehash? ( dev-cpp/sparsehash )
	test? ( dev-cpp/gtest )"
RDEPEND="${DEPEND}"

src_unpack() {
  unpack "${A}"
  mv bayon-"${GIT_COMMIT}" "${P}"
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-ldpath.patch || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README TODO
}
