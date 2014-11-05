# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 user webapp

DESCRIPTION="Open source software to collaborate on code"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-ce"
SRC_URI=
EGIT_REPO_URI="https://gitlab.com/gitlab-org/gitlab-ce.git"
EGIT_BRANCH="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
  dev-lang/ruby:2.0
  >=dev-db/redis-2.0
  >=dev-vcs/git-1.7.10"
RDEPEND="${DEPEND}"

WEBAPP_MANUAL_SLOT="yes"

pkg_setup() {
  webapp_pkg_setup
  enewgroup gitlab
  enewuser gitlab -1 -1 -1 gitlab
}
