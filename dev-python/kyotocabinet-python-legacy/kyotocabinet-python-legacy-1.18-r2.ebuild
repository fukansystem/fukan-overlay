EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils

DESCRIPTION="Python 2.x Binding of Kyoto Cabinet"
HOMEPAGE="http://fallabs.com/kyotocabinet/pythonlegacydoc/"
SRC_URI="http://fallabs.com/kyotocabinet/pythonlegacypkg/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE=""
RDEPEND=">=dev-db/kyotocabinet-1.2.63"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
