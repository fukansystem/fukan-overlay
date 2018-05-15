EAPI="6"

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4,3_5,3_6} )

inherit distutils-r1 eutils

DESCRIPTION="Web APIs for Django"
HOMEPAGE="http://www.django-rest-framework.org/"
SRC_URI="https://github.com/encode/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE=""

RDEPEND="
	>=dev-python/django-1.10[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS="CONTRIBUTING.md ISSUE_TEMPLATE.md PULL_REQUEST_TEMPLATE.md README.md"
