EAPI="5"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Tiny python code for parsing data from Microsoft's Office Open XML Spreadsheet format"
HOMEPAGE="https://github.com/staale/py-xlsx"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE=""

DOCS=( README.rst )

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
