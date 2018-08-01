EAPI=6

inherit eutils git-r3

DESCRIPTION="A simple and fast clustering tool"
HOMEPAGE="https://github.com/fujimizu/bayon"
EGIT_REPO_URI="https://github.com/fujimizu/bayon.git"
EGIT_COMMIT="7d429239563973f61e47538f1af31f9ace0cac88"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE="+sparsehash test"
DEPEND="
	sparsehash? ( dev-cpp/sparsehash )
	test? ( dev-cpp/gtest )"
RDEPEND="${DEPEND}"

DOCS=( README TODO )

src_prepare() {
	epatch "${FILESDIR}"/${PN}-ldpath.patch
	default
}
