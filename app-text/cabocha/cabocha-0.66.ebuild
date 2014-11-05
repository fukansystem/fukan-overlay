# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit perl-module eutils distutils

DESCRIPTION="Yet Another Japanese Dependency Structure Analyzer"
HOMEPAGE="http://code.google.com/p/cabocha/"
SRC_URI="http://cabocha.googlecode.com/files/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE="perl python unicode"

DEPEND=">=app-text/crf++-0.55
	>=app-text/mecab-0.993"

src_prepare() {
  epatch "${FILESDIR}"/${P}-unistd.patch
}

src_configure() {
	local myargs=""
	if use unicode; then
		myargs="${myargs} --with-charset=utf8 --enable-utf8-only"
	fi
	econf ${myargs}
}

src_compile() {
	emake

	if use perl ; then
		pushd perl
		perl-module_src_compile || die
		popd
	fi
	if use python ; then
		pushd python
		distutils_src_compile || die
		popd
	fi
}

src_test() {
	make check || die
}

src_install() {
	make DESTDIR=${D} install || die

	dodoc AUTHORS README TODO

	if use perl ; then
		pushd perl
		perl-module_src_install || die
		popd
	fi
	if use python ; then
		pushd python
		distutils_src_install || die
		popd
	fi
}
