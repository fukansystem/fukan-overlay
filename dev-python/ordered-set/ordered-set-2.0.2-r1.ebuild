EAPI="5"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="A MutableSet that remembers its order, so that every entry has an index."
HOMEPAGE="https://pypi.python.org/pypi/ordered-set/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	"${PYTHON}" tests.py
}

python_install_all() {
  distutils-r1_python_install_all
}
