EAPI=6

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit autotools distutils-r1 eutils git-r3

DESCRIPTION="A fast machine learning library for online learning"
HOMEPAGE="http://hunch.net/~vw/"
EGIT_REPO_URI="https://github.com/JohnLangford/vowpal_wabbit.git"
EGIT_COMMIT="8.6.1"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE=""
RDEPEND="
	${PYTHON_DEPS}
	dev-libs/boost[python,${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

src_prepare() {
	default_src_prepare
	epatch "${FILESDIR}"/${PN}-python-setup.patch
	pushd python || die
	distutils-r1_src_prepare
	popd || die
}

src_configure() {
	# eautoreconf
	default_src_configure
	pushd python || die
	distutils-r1_src_configure
	popd || die
}

src_compile() {
	pushd python || die
	distutils-r1_src_compile
	popd || die
}

src_test() {
	pushd python || die
	distutils-r1_src_test
	popd || die
}

src_install() {
	pushd python || die
	distutils-r1_src_install
	popd || die
}
