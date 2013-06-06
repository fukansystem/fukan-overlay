# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit distutils

DESCRIPTION="RPC that doesn't break your back."
HOMEPAGE="http://spyne.io/"
SRC_URI="https://pypi.python.org/packages/source/s/spyne/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="django json msgpack xml yaml"

RDEPEND="dev-python/pytz
	virtual/pyparsing
	django? ( >=dev-python/django-1.2 )
	json? ( dev-python/simplejson )
	msgpack? ( dev-python/msgpack )
	xml? ( >=dev-python/lxml-2.3 )
	yaml? ( dev-python/pyyaml )"
DEPEND="${RDEPEND}
	dev-python/setuptools"
