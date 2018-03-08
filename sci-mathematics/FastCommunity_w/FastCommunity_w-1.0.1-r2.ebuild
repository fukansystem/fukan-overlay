EAPI="6"

inherit eutils

DESCRIPTION="The fast modularity maximization algorithm (weighted version)"
HOMEPAGE="http://www.cs.unm.edu/~aaron/research/fastmodularity.htm"
SRC_URI="http://www.cs.unm.edu/~aaron/research/${PN}_GPL_v${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}_GPL_v${PV}

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc.patch
	epatch "${FILESDIR}"/${P}-tuple.patch
	epatch "${FILESDIR}"/${PN}-ignore_ext.patch
	sed -i \
		-e "s:-O3 -fomit-frame-pointer -funroll-loops -fforce-mem -fforce-addr -fexpensive-optimizations:${CFLAGS}:" \
		-e "s:^LDFLAGS = :LDFLAGS = ${LDFLAGS}:" \
		Makefile || die
	default
}

src_install() {
	dobin FastCommunity_wMH
}
