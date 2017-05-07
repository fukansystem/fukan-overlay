EAPI="5"

PYTHON_COMPAT=( python2_{6,7} )
DISTUTILS_OPTIONAL=1

inherit autotools flag-o-matic eutils distutils-r1 perl-module

G_KEY="0B4y35FiV1wh7cGRCUUJHVTNJRnM"

DESCRIPTION="Yet Another Japanese Dependency Structure Analyzer"
HOMEPAGE="https://taku910.github.io/cabocha/"
GIT_COMMIT="7e7d4decefb2a5e7db3f56e75fe1aa14e723c767"
SRC_URI="https://github.com/taku910/cabocha/archive/${GIT_COMMIT}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE="perl python unicode"

RDEPEND="
	>=app-text/crf++-0.55
	>=app-text/mecab-0.993
	python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

pkg_setup() {
	use python && python_setup
}

src_unpack() {
	default
  mv cabocha-"${GIT_COMMIT}" "${P}"
}

src_prepare() {
  eautoreconf
	if use python; then
		pushd python || die
		distutils-r1_src_prepare
		popd || die
	fi
}

src_configure() {
	local myargs=""
	if use unicode; then
		myargs="${myargs} --with-charset=utf8 --enable-utf8-only"
	fi
	econf ${myargs}
}

src_compile() {
	default
	if use perl ; then
		pushd perl || die
		perl-module_src_compile
		popd || die
	fi
	if use python ; then
		export PATH="${S}:${PATH}"
		pushd python || die
		python_fix_shebang .
		append-cppflags "-I${S}/src"
		append-ldflags "-L${S}/src/.libs"
		distutils-r1_src_compile
		popd || die
	fi
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog INSTALL NEWS README RESULT TODO
	if use perl ; then
		pushd perl || die
		perl-module_src_install
		popd || die
	fi
	if use python ; then
		pushd python || die
		distutils-r1_src_install
		popd || die
	fi
}
