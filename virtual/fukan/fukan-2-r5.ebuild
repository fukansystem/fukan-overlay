# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Fukan system"
HOMEPAGE="http://academic-landscape.com/"
SRC_URI=""

LICENSE=""
SLOT="2"
KEYWORDS="amd64 x86 amd64-linux x86-linux x64-macos x86-macos"
IUSE="+test"

RDEPEND="
  app-text/cabocha[python]
  app-text/hunpos
  app-text/pdfminer[cjk]
  =dev-lang/python-2*
  dev-python/beautifulsoup:python-2
  dev-python/celery
  dev-python/django
  dev-python/django-guardian
  dev-python/flup
  dev-python/kyotocabinet-python-legacy
  dev-python/mechanize
  dev-python/msgpack
  dev-python/networkx
  dev-python/nltk
  dev-python/ordered-set
  dev-python/pyparsing
  dev-python/py-xlsx
  dev-python/suds
  dev-python/psycopg:2
  >=sci-libs/scipy-0.11
  sci-mathematics/bayon
  sci-mathematics/FastCommunity
  sci-mathematics/FastCommunity_w
  sci-visualization/lgl
  sys-devel/gettext
  virtual/python-imaging
  test? (
    dev-python/pep8
    dev-python/sphinx
  )"
DEPEND="${RDEPEND}"
