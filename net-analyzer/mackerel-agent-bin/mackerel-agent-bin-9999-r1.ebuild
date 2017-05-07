EAPI="6"

MY_PN="mackerel-agent"
MY_PV="latest"

DESCRIPTION="Agent program to post your hosts' metrics to mackerel.io."
HOMEPAGE="https://mackerel.io/"
SRC_URI="http://file.mackerel.io/agent/tgz/${MY_PN}-${MY_PV}.tar.gz"
RESTRICT="mirror"

LICENSE="mackerel-terms"
SLOT="0"
KEYWORDS="amd64"
IUSE="logrotate"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/mackerel-agent"

src_install() {
  dobin mackerel-agent

  insinto /etc/mackerel-agent
  doins mackerel-agent.conf

  if use logrotate; then
    insinto /etc/logrotate.d
    newins "${FILESDIR}/mackerel-agent.logrotate" mackerel-agent
  fi

  newinitd "${FILESDIR}/mackerel-agent.init.d" mackerel-agent
  newconfd "${FILESDIR}/mackerel-agent.conf.d" mackerel-agent

  keepdir /var/lib/mackerel-agent
}
