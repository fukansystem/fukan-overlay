EAPI=6

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python{2_7,3_6} )

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
	dev-libs/igraph
	dev-python/kyotocabinet-python[$(python_gen_usedep 'python3*')]
	dev-python/kyotocabinet-python-legacy[$(python_gen_usedep 'python2*')]
	dev-python/vowpalwabbit[${PYTHON_USEDEP}]
	>=sci-libs/scipy-0.11
	sci-libs/scikits_learn
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
