# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pdfminer/pdfminer-20140328.ebuild,v 1.1 2014/05/01 10:43:05 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

DESCRIPTION="Python tool for extracting information from PDF documents"
HOMEPAGE="http://www.unixuser.org/~euske/python/pdfminer/ http://pypi.python.org/pypi/pdfminer/"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cjk doc examples"

python_compile_all(){
  use cjk && emake cmap
	use examples && emake -C samples all
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/. )
	use examples && local EXAMPLES=( samples/. )
	distutils-r1_python_install_all
}
