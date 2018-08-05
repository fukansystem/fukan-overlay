EAPI=6

inherit eutils toolchain-funcs java-pkg-opt-2

MY_PN="LGL"

DESCRIPTION="LGL is a compendium of applications for making the visualization of
large networks and trees tractable."
HOMEPAGE="http://lgl.sourceforge.net/"
SRC_URI="mirror://sourceforge/lgl/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE="java"
RDEPEND="
	dev-libs/boost
	java? ( >=virtual/jre-1.4 )"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-libs/boost
	java? (
		dev-java/jama
		>=virtual/jdk-1.4 )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc4.3.3.patch

	pushd "${S}"/src || die
	sed -i \
		-e "s:-Wall -O3 -ftemplate-depth-30:-Wall ${CFLAGS} -ftemplate-depth-50:" \
		Makefile || die
	popd || die

	default
}

src_compile() {
	tc-export CC CXX CPP AR RANLIB

	perl setup.pl -i || die

	if use java; then
		pushd Java || die

		ejavac -classpath $(java-config --classpath jama):. $(find -name *.java)

		jar cmf ImageMaker/META-INF/MANIFEST.MF \
			imageMaker.jar Viewer2D Jama ImageMaker
		jar cmf Viewer2D/META-INF/MANIFEST.MF \
			lglview.jar Viewer2D Jama

		popd || die
	fi
}

src_install() {
	pushd bin || die
	dobin lglayout2D lglayout3D lglbreakup lglrebuild
	popd || die

	if use java; then
		pushd Java || die
		java-pkg_dojar imageMaker.jar
		java-pkg_dojar lglview.jar
		popd || die
	fi
}
