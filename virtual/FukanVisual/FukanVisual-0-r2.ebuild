EAPI=4

DESCRIPTION="Fukan visualization system"
HOMEPAGE="http://133.11.90.76/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE=""

COMMON_DEPEND="dev-java/absolutelayout
	dev-java/commons-collections
	dev-java/commons-io:1
	dev-java/commons-lang:2.1
	dev-java/gson
	dev-java/prefuse
	dev-java/swing-layout:1"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEPEND}"
DEPEND=">=virtual/jdk-1.5
	${COMMON_DEPEND}"