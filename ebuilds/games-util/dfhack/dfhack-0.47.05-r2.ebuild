# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Memory access library with tools for the game Dwarf Fortress"
HOMEPAGE="https://github.com/DFHack/dfhack"
SRC_URI="https://github.com/DFHack/dfhack/releases/download/${PVR}/${PF}-Linux-64bit-gcc-7.tar.bz2"

LICENSE="Zlib"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="games-roguelike/dwarf-fortress"
RDEPEND="${DEPEND}"
BDEPEND=""
