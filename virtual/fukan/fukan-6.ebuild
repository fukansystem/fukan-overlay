# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Fukan system"
HOMEPAGE="http://133.11.90.76/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="+pep8"

RDEPEND="app-text/cabocha
	app-text/hunpos
	app-text/pdfminer[cjk]
	=dev-lang/python-2*
	dev-python/beautifulsoup:python-2
	dev-python/django
	dev-python/imaging
	dev-python/kyotocabinet-python-legacy
	dev-python/mechanize
	dev-python/msgpack
	dev-python/nltk
	dev-python/nose
	dev-python/pyparsing
	dev-python/sphinx
	=sci-libs/scipy-0.11*
	sci-mathematics/bayon
	sci-mathematics/FastCommunity
	sci-mathematics/FastCommunity_w
	sci-visualization/lgl[java]
	pep8? ( dev-python/pep8 )"
DEPEND="${RDEPEND}"
