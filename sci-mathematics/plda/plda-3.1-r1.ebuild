EAPI="6"

inherit eutils toolchain-funcs

DESCRIPTION="PLDA: Parallel Latent Dirichlet Allocation in C++"
HOMEPAGE="http://openbigdatagroup.github.io/plda"
GIT_COMMIT="52d63c30f37f93176f5fa52df80c5a165543d04e"
SRC_URI="https://github.com/openbigdatagroup/plda/archive/${GIT_COMMIT}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="mpi"

RDEPEND="mpi? ( virtual/mpi )"
DEPEND="${RDEPEND}"

DOCS=( INSTALL README )

S="${WORKDIR}"/${PN}

src_prepare() {
	sed -i \
		-e "s:CC=g++:CC=$(tc-getCXX):" \
		-e "s:CFLAGS=-O3 -Wall -Wno-sign-compare:CFLAGS=${CXXFLAGS}:" \
		-e "s:MPICC=mpicxx:MPICC=mpic++:" \
		Makefile || die
	default
}

src_compile() {
	emake lda infer
	cp lda plda-train || die
	cp infer plda-infer  || die
	if use mpi; then
		emake mpi_lda
		cp mpi_lda plda-mpi-train || die
	fi
}

src_install() {
	dobin plda-train plda-infer
	if use mpi; then
		dobin plda-mpi-train
	fi
	einstalldocs
}
