EAPI="6"

inherit autotools eutils

MY_P="${P/crf/CRF}"
DESCRIPTION="Yet Another CRF toolkit for segmenting/labelling sequential data"
HOMEPAGE="https://code.google.com/p/crfpp/"
SRC_URI="http://crfpp.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="|| ( BSD LGPL-2.1 )"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="doc examples static-libs"

S="${WORKDIR}/${MY_P}"

DOCS=( AUTHORS README )

src_prepare() {
	sed -i \
		-e "/CFLAGS/s/-O3/${CFLAGS}/" \
		-e "/CXXFLAGS/s/-O3/${CXXFLAGS}/" \
		configure.in || die

	# bug #365921
	epatch "${FILESDIR}/${PN}-0.54-gcc46.patch"

	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_test() {
	for task in example/* ; do
		(
			cd "${task}"
			./exec.sh || die "failed test in ${task}"
		)
	done
}

src_install() {
	emake DESTDIR="${D}" install

	if ! use static-libs ; then
		find "${ED}" -name "*.la" -type f -delete || die
	fi

	use doc && local HTML_DOCS=( docs/. )
	use examples && local EXAMPLES=( examples/. )
	einstalldocs
}
