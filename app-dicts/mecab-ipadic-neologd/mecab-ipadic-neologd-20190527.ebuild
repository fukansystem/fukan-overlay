EAPI=6

inherit git-r3

DESCRIPTION="Neologism dictionary based on the language resources on the Web"
HOMEPAGE="https://github.com/neologd/mecab-ipadic-neologd"
EGIT_REPO_URI="https://github.com/neologd/mecab-ipadic-neologd.git"
EGIT_COMMIT="0700f47e9801c1b7c5b49754d8721c9014a75f6f"

MECAB_IPADIC="2.7.0-20070801"
SRC_URI="mirror://sourceforge/mecab/mecab-ipadic-${MECAB_IPADIC}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE=""
RDEPEND="
  app-dicts/mecab-ipadic[unicode]
  app-text/mecab[unicode]"
DEPEND="${DEPEND}"

src_unpack() {
  git-r3_src_unpack
  # Downloading ipadic file from the script fails on Google Cloud Build for some
  # reason. Have portage download the file and place it to the build directory.
  mkdir -p "${S}"/build || die
  cp "${DISTDIR}"/"${A}" "${S}"/build || die
}

src_compile() {
  bash ./libexec/make-mecab-ipadic-neologd.sh \
    -p "${D}"$(mecab-config --dicdir)/mecab-ipadic-neologd || die
}

src_install() {
  mkdir -p "${D}"$(mecab-config --dicdir)/mecab-ipadic-neologd || die
  bash ./libexec/install-mecab-ipadic-neologd.sh \
    -p "${D}"$(mecab-config --dicdir)/mecab-ipadic-neologd || die
}
