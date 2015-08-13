# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="python? 2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit flag-o-matic eutils distutils perl-module

G_KEY="0B4y35FiV1wh7cGRCUUJHVTNJRnM"

DESCRIPTION="Yet Another Japanese Dependency Structure Analyzer"
HOMEPAGE="http://code.google.com/p/cabocha/"
SRC_URI="http://googledrive.com/host/${G_KEY}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE="perl python unicode"

DEPEND=">=app-text/crf++-0.55
	>=app-text/mecab-0.993"
RDEPEND="${DEPEND}"

src_prepare() {
	if use python; then
		pushd python || die
		python_convert_shebangs -r 2 .
		distutils_src_prepare
		popd || die
	fi
}

src_configure() {
	local myargs=""
	if use unicode; then
		myargs="${myargs} --with-charset=utf8 --enable-utf8-only"
	fi
	econf ${myargs}
}

src_compile() {
	emake || die

	if use perl ; then
		pushd perl || die
		perl-module_src_compile
		popd || die
	fi
	if use python ; then
		export PATH="${S}:${PATH}"
		pushd python || die
		append-cppflags "-I${S}/src"
		append-ldflags "-L${S}/src/.libs"
		distutils_src_compile
		popd || die
	fi
}

src_test() {
	make check || die
}

src_install() {
	emake DESTDIR=${D} install || die

	dodoc AUTHORS README TODO

	if use perl ; then
		pushd perl || die
		perl-module_src_install
		popd || die
	fi
	if use python ; then
		pushd python || die
		distutils_src_install
		popd || die
	fi
}
