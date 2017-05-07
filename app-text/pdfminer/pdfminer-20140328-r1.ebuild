EAPI="6"

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

DESCRIPTION="Python tool for extracting information from PDF documents"
HOMEPAGE="https://euske.github.io/pdfminer/ http://pypi.python.org/pypi/pdfminer/"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="cjk doc examples"

python_compile_all(){
  use cjk && emake cmap
	use examples && emake -C samples all
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/. )
	use examples && local EXAMPLES=( samples/. )
	distutils-r1_python_install_all
}
