# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Based on game-util/dfhack-0.43.05.2 from layman overlay eroen

EAPI=7

DESCRIPTION="Memory hacking library for Dwarf Fortress and a set of tools that use it"
HOMEPAGE="http://github.com/DFHack/dfhack"
SRC_URI="https://github.com/DFHack/dfhack/archive/${PVR}.tar.gz"

LICENSE="ZLIB MIT BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="api dfusion doc egg isoworld minimal stonesense"

BDEPEND="
	=games-roguelike/dwarf-fortress-${PV}
	dev-perl/XML-LibXML
	dev-perl/XML-LibXSLT
	doc? ( app-doc/doxygen )
	"
LIBRARY_DEPEND="
	|| ( sys-libs/zlib[abi_x86_32]
		( sys-libs/zlib
			app-emulation/emul-linux-x86-baselibs
		)
	)
	stonesense? ( media-libs/fontconfig[abi_x86_32]
		app-emulation/emul-linux-x86-baselibs[development]
		media-libs/freetype[abi_x86_32]
		x11-libs/libICE[abi_x86_32]
		x11-libs/libSM[abi_x86_32]
		x11-libs/libX11[abi_x86_32]
		x11-libs/libXcursor[abi_x86_32]
		x11-libs/libXext[abi_x86_32]
		x11-libs/libXinerama[abi_x86_32]
		x11-libs/libXrandr[abi_x86_32]
	)
	"
DEPEND="${LIBRARY_DEPEND} ${BDEPEND}"
RDEPEND="${LIBRARY_DEPEND}
	stonesense? ( app-emulation/emul-linux-x86-opengl
		app-emulation/emul-linux-x86-xlibs
		)
	"

DF_DIR=/opt/dwarf-fortress/

src_unpack() {
	unpack ${A}
}

src_configure() {
	mycmakeargs=(
		"-DCMAKE_BUILD_TYPE:string=Release"
		"-DCMAKE_INSTALL_PREFIX=${DF_DIR}"
		)
	cmake-utils_src_configure
}

src_compile() {
	cd build
	cmake .. -G Ninja
}

src_install() {
	ninja install
}


