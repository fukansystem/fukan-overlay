EAPI="3"
inherit autotools eutils

MY_P="${P/crf/CRF}"
DESCRIPTION="Yet Another CRF toolkit for segmenting/labelling sequential data"
HOMEPAGE="https://code.google.com/p/crfpp/"
SRC_URI="http://crfpp.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="|| ( BSD LGPL-2.1 )"
SLOT="0"
KEYWORDS="amd64 x86 ~x86-fbsd"
IUSE="examples static-libs"

S="${WORKDIR}/${MY_P}"

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
	econf $(use_enable static-libs static) || die
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
	emake DESTDIR="${D}" install || die

	if ! use static-libs ; then
		find "${ED}" -name "*.la" -type f -delete || die
	fi

	dodoc AUTHORS README || die
	dohtml -r doc/* || die

	if use examples ; then
		insinto /usr/share/doc/${PF}
		doins -r example || die
	fi
}
