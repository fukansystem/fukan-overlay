EAPI="6"

PYTHON_COMPAT=( python2_7 )
DISTUTILS_OPTIONAL=1

inherit distutils-r1

DESCRIPTION="Fukan system"
HOMEPAGE="http://academic-landscape.com/"
SRC_URI=""

LICENSE=""
SLOT="4"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="crawler doc experimental +fastcgi +postgres +unittest"

DEPEND="
	${PYTHON_DEPS}
	dev-python/nltk[${PYTHON_USEDEP}]"
RDEPEND="
	${DEPEND}
	dev-python/celery[${PYTHON_USEDEP}]
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/django-guardian[${PYTHON_USEDEP}]
	dev-python/kyotocabinet-python-legacy[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/ordered-set[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pymongo[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=sci-libs/scipy-0.11
	sci-libs/scikits_learn
	sci-mathematics/bayon
	sci-mathematics/FastCommunity
	sci-mathematics/FastCommunity_w
	sci-visualization/lgl
	sys-devel/gettext
	crawler? (
		dev-python/beautifulsoup:python-2[${PYTHON_USEDEP}]
		dev-python/mechanize[${PYTHON_USEDEP}]
		dev-python/suds[${PYTHON_USEDEP}] )
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}] )
	experimental? (
		app-text/cabocha[python]
		app-text/pdfminer[cjk]
		dev-python/pyparsing[${PYTHON_USEDEP}]
		dev-python/py-xlsx[${PYTHON_USEDEP}] )
	fastcgi? (
		dev-python/flup[${PYTHON_USEDEP}] )
	postgres? (
		dev-python/psycopg:2[${PYTHON_USEDEP}] )
	unittest? (
		dev-python/pycodestyle[${PYTHON_USEDEP}] )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

NLTK_CORPUS=( maxent_treebank_pos_tagger punkt stopwords wordnet )

S="${WORKDIR}"

pkg_setup() {
	python_setup
}

src_install() {
	mkdir -p "${ED}"/usr/share/nltk_data || die
	${EPYTHON} -m nltk.downloader \
		-d "${ED}"/usr/share/nltk_data \
		"${NLTK_CORPUS[@]}" || die
}
