# Copyright 2019 Haelwenn (lanodan) Monnier <contact@hacktivis.me>
# Distributed under the terms of the GNU General Public License v2

# Based on dev-util/pmbootstrap-1.22.0 from layman overlay menelkir

EAPI=7

PYTHON_COMPAT=( python3_7 )

inherit distutils-r1

DESCRIPTION="Sophisticated chroot/build/flash tool to develop and install postmarketOS."
HOMEPAGE="https://postmarketos.org/ https://pypi.org/project/pmbootstrap/"
SRC_URI="https://files.pythonhosted.org/packages/67/8b/944fa990fc15daaedcf8ce7d85a2dec8772757d233a63d95b2896a85ca46/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
