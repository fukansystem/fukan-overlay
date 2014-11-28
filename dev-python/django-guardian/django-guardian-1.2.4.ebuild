# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_3} )

inherit distutils-r1

DESCRIPTION="Implementation of per object permissions for Django 1.2+"
HOMEPAGE="https://github.com/lukaszb/django-guardian"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-python/django-1.2[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	"${PYTHON}" tests.py
}

python_install_all() {
  distutils-r1_python_install_all
  dodoc CHANGES README.rst
}
