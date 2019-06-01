EAPI=6

inherit git-r3

DESCRIPTION="Neologism dictionary based on the language resources on the Web"
HOMEPAGE="https://github.com/neologd/mecab-ipadic-neologd"
EGIT_REPO_URI="https://github.com/neologd/mecab-ipadic-neologd.git"
EGIT_COMMIT="0700f47e9801c1b7c5b49754d8721c9014a75f6f"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"

IUSE=""
RDEPEND="
  app-dicts/mecab-ipadic[unicode]
  app-text/mecab[unicode]"
DEPEND="${DEPEND}"

src_compile() {
  bash ./libexec/make-mecab-ipadic-neologd.sh \
    -p "${D}"$(mecab-config --dicdir)/mecab-ipadic-neologd || die
}

src_install() {
  mkdir -p "${D}"$(mecab-config --dicdir)/mecab-ipadic-neologd || die
  bash ./libexec/install-mecab-ipadic-neologd.sh \
    -p "${D}"$(mecab-config --dicdir)/mecab-ipadic-neologd || die
}
