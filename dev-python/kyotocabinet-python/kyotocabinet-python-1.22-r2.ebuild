EAPI=6

PYTHON_COMPAT=( python{3_4,3_5,3_6} )

inherit distutils-r1 eutils

DESCRIPTION="Python 3.x Binding of Kyoto Cabinet"
HOMEPAGE="http://fallabs.com/kyotocabinet/pythondoc/"
SRC_URI="http://fallabs.com/kyotocabinet/pythonpkg/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE=""
RDEPEND=">=dev-db/kyotocabinet-1.2.47"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
