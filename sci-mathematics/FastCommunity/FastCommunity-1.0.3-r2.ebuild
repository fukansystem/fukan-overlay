EAPI="6"

inherit eutils

DESCRIPTION="The fast modularity maximization algorithm"
HOMEPAGE="http://www.cs.unm.edu/~aaron/research/fastmodularity.htm"
SRC_URI="http://www.cs.unm.edu/~aaron/research/${PN}_GPL_v${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	default
	mv "${WORKDIR}"/${PN}_GPL_v${PV} "${S}"
}

src_prepare() {
	epatch "${FILESDIR}"/${PF}-gcc.patch
	sed -i \
		-e "s:-O3 -fomit-frame-pointer -funroll-loops -fforce-mem -fforce-addr -fexpensive-optimizations:${CFLAGS}:" \
		-e "s:^LDFLAGS = :LDFLAGS = ${LDFLAGS}:" \
		Makefile || die
	default
}

src_install() {
	dobin FastCommunityMH
}
