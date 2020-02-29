EAPI=6

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="Fukan system"
HOMEPAGE="http://academic-landscape.com/"
SRC_URI=""

LICENSE=""
SLOT="4"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="postgres wsgi"

DEPEND="${PYTHON_DEPS}"
RDEPEND="
	${DEPEND}
	app-dicts/mecab-ipadic-neologd
	app-text/mecab
	dev-lang/swig
	dev-libs/boost[python,${PYTHON_USEDEP}]
	dev-libs/igraph
	dev-python/kyotocabinet-python[${PYTHON_USEDEP}]
	>=sci-libs/scipy-0.11[${PYTHON_USEDEP}]
	sci-libs/scikits_learn[${PYTHON_USEDEP}]
	sci-mathematics/bayon
	sci-mathematics/FastCommunity
	sci-mathematics/FastCommunity_w
	sci-visualization/lgl
	sys-devel/gettext
	postgres? (
		dev-python/psycopg:2[${PYTHON_USEDEP}] )
	wsgi? (
		www-servers/uwsgi[python,${PYTHON_USEDEP}] )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S="${WORKDIR}"

pkg_setup() {
	python_setup
}
