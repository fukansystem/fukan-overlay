# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

inherit perl-module eutils

DESCRIPTION="Yet Another Japanese Dependency Structure Analyzer"
HOMEPAGE="http://code.google.com/p/cabocha/"
SRC_URI="http://cabocha.googlecode.com/files/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"

IUSE="perl unicode"

DEPEND="app-text/crf++
	app-text/mecab"

src_configure() {
	local myargs=""
	if use unicode; then
		myargs="${myargs} --with-charset=utf8"
	fi
	econf ${myargs}
}

src_compile() {
	emake

	if use perl ; then
		cd perl
		perl-module_src_compile || die
	fi
}

src_test() {
	make check || die
}

src_install() {
	make DESTDIR=${D} install || die

	dodoc AUTHORS README TODO

	if use perl ; then
		cd perl
		perl-module_src_install || die
	fi
}
