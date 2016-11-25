EAPI=4

DESCRIPTION="Fukan system"
HOMEPAGE="http://academic-landscape.com/"
SRC_URI=""

LICENSE=""
SLOT="4"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="crawler doc experimental +fastcgi +postgres unittest"

RDEPEND="
	=dev-lang/python-2*
  dev-python/celery
	dev-python/django
	dev-python/django-guardian
	dev-python/kyotocabinet-python-legacy
	dev-python/msgpack
	dev-python/nltk
	dev-python/ordered-set
  dev-python/pillow
	>=sci-libs/scipy-0.11
	sci-mathematics/bayon
	sci-mathematics/FastCommunity
	sci-mathematics/FastCommunity_w
	sci-visualization/lgl
	sys-devel/gettext
  crawler? (
    dev-python/beautifulsoup:python-2
    dev-python/mechanize
    dev-python/suds )
	doc? (
		dev-python/sphinx )
  experimental? (
    app-text/cabocha[python]
    app-text/pdfminer[cjk]
    dev-python/pyparsing
    dev-python/py-xlsx )
  fastcgi? (
    dev-python/flup )
  postgres? (
    dev-python/psycopg:2 )
	unittest? (
		dev-python/pep8 )"
DEPEND=""
