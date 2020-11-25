# By eroen, 2012-2014
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# $Header: $

EAPI=5
inherit base eutils multilib git-r3 cmake-utils games

df_PV=${PV%.${PV#*.*.*.}}
df_PV=${df_PV#0.}
df_PV=${df_PV%%_*}

DESCRIPTION="Memory hacking library for Dwarf Fortress and a set of tools that
use it"
HOMEPAGE="http://github.com/DFHack/dfhack"
EGIT_REPO_URI="git://github.com/DFHack/dfhack.git"
#EGIT_BRANCH=
EGIT_COMMIT=${PV%.${PV#*.*.*.}}-r${PV#*.*.*.} # 0.40.08.2 -> 0.40.08-r2
SRC_URI="http://cloud.github.com/downloads/jjyg/dfhack/libruby187.tar.gz"

KEYWORDS="~amd64" # ~x86

CMAKE_MIN_VERSION=2.8.9
CMAKE_REMOVE_MODULES_LIST="FindCurses FindDoxygen CMakeVS10FindMake"

LICENSE="ZLIB MIT BSD-2"
SLOT=${df_PV}
IUSE="api dfusion doc egg isoworld minimal stonesense"

HDEPEND="
	dev-perl/XML-LibXML
	dev-perl/XML-LibXSLT
	doc? ( app-doc/doxygen )
	"
LIBRARY_DEPEND="
	|| ( sys-libs/zlib[abi_x86_32]
		( sys-libs/zlib
			app-emulation/emul-linux-x86-baselibs ) )
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
DEPEND="${LIBRARY_DEPEND}
	${HDEPEND}"
RDEPEND="${LIBRARY_DEPEND}
	stonesense? ( app-emulation/emul-linux-x86-opengl
		app-emulation/emul-linux-x86-xlibs
		)
	"
# Circular dependency when building egg.
PDEPEND="~games-simulation/dwarffortress-${df_PV}"

## missing multilib
#dev-lang/lua - binary bundled
#dev-libs/protobuf - bundled
## stonesense
#allegro - binary bundled
#	dev-libs/atk (libatk-1.0.so.0) - gtklibs
#	dev-libs/glib (libgthread-2.0.so.0,libglib-2.0.so.0,libgobject-2.0.so.0,libgmodule-2.0.so.0,libgio-2.0.so.0) - baselibs
#	media-libs/fontconfig (libfontconfig.so.1)
#	media-libs/freetype (libfreetype.so.6)
#	media-libs/jpeg:62 (libjpeg.so.62) - baselibs
#   virtual/glu (libGLU.so.1) - opengl
#	media-libs/libpng:1.2 (libpng12.so.0) - baselibs
#	virtual/opengl (libGL.so.1)
#	sys-libs/zlib (libz.so.1) - baselibs
#	x11-libs/cairo (libcairo.so.2) - gtklibs
#	x11-libs/gdk-pixbuf (libgdk_pixbuf) - gtklibs
#	x11-libs/gtk+ (libgdk-x11-2.0.so.0,libgtk-x11-2.0.so.0) - gtklibs
#	x11-libs/libICE (libICE.so.6)
#	x11-libs/libSM (libSM.so.6)
#	x11-libs/libX11 (libX11.so.6)
#	x11-libs/libXcursor (libXcursor.so.1)
#	x11-libs/libXext (libXext.so.6)
#	x11-libs/libXinerama (libXinerama.so.1)
#	x11-libs/libXrandr (libXrandr.so.2)
#	x11-libs/pango (libpangocairo-1.0.so.0,libpango-1.0.so.0,libpangoft2-1.0.so.0) - gtklibs

pkg_setup() {
	multilib_toolchain_setup x86

	df_executable="dwarffortress-${df_PV}"
	dfhack_datadir="${GAMES_DATADIR}/${P}"
	dfhack_docdir="/usr/share/doc/${P}"
	dfhack_statedir="${GAMES_STATEDIR}/${P}"

	dfhack_libdir=$(games_get_libdir)/dwarffortress-${df_PV}

	QA_FLAGS_IGNORED=("${dfhack_libdir#/}"/libruby.so)
	QA_PRESTRIPPED=("${dfhack_libdir#/}"/libruby.so)
	QA_SONAME_NO_SYMLINK=("${dfhack_libdir#/}"/libruby.so)
}

src_unpack() {
	git-r3_src_unpack
	unpack ${A}
	mv "${WORKDIR}"/libruby1.8.so.1.8.7 "${WORKDIR}"/libruby.so || die
}

src_prepare() {
	# rm -r patches-master-$(date -I)/
	# stg export -n -d patches-master-$(date -I) -e patch
	# rm /usr/local/portage/games-util/dfhack/files/dfhack-0.40.06.9999/*
	# cp patches-master-$(date -I)/* /usr/local/portage/games-util/dfhack/files/dfhack-0.40.06.9999/
	epatch "${FILESDIR}"/${P}/*.patch

	pushd "${S}"/depends/clsocket
#	epatch "${FILESDIR}"/clsocket/0001-Compile-static-library-as-PIC.patch
	popd

	#if use stonesense; then
	#	pushd "${S}"/plugins/stonesense
	#	epatch "${FILESDIR}"/stonesense-${PV}/01-null-isn-t-an-int32.patch
	#	epatch "${FILESDIR}"/stonesense-${PV}/02-configurable-install-paths.patch
	#	epatch "${FILESDIR}"/stonesense-${PV}/03-don-t-segfault-if-logfile-is.patch
	#	epatch "${FILESDIR}"/stonesense-${PV}/04-compile-time-configuration-of.patch
	#	epatch "${FILESDIR}"/stonesense-${PV}/05-compile-time-configurable-log.patch
	#	epatch "${FILESDIR}"/stonesense-${PV}/06-fix-b0rked-xml-file.patch
	#	epatch "${FILESDIR}"/stonesense-${PV}/07-compile-time-configurable-dump.patch
	#	epatch "${FILESDIR}"/stonesense-${PV}/08-compile-time-configurable.patch
	#	# Patches that no longer fit upstream, not updated yet.
	#	#epatch "${FILESDIR}"/stonesense/0003-screenshots-in-home-dir.patch
	#	popd
	#fi
	#if use isoworld; then
	#	pushd "${S}"/plugins/isoworld
	#	epatch "${FILESDIR}"/isoworld-${PV}/01-missing-include-dir.patch
	#	popd
	#	ewarn "The isoworld plugin requires agui, and will probably fail to build"
	#fi

	# Fix other scripts
#	if use dfusion; then
#	sed -f - -i plugins/Dfusion/luafiles/{init.lua,friendship/{init.lua,plugin.lua,install.lua},triggers/{plugin.lua,functions_menu.lua},friendship_civ/init.lua,common.lua,embark/{init.lua,plugin.lua},migrants/{init.lua,plugin.lua},xml_struct.lua,xml_types.lua} <<- EOF || die
#		s:("dfusion/:("${datadir}/dfusion/:
#		s:('dfusion/:('${datadir}/dfusion/:
#		EOF
#		sed -i "s:libs/Dwarf_Fortress:Dwarf_Fortress:" plugins/Dfusion/luafiles/common.lua
#	fi

	##Issues:
	# - dfusion is strange. It's always been that, though.
	# - prebuilt ruby
	# - bundled lua
	# - isoworld requires agui
	# - prebuilt allegro for stonesense.
	# - stonesense conf file: /usr/share/games/dfhack-9999/stonesense/init.txt
	# Set in ./Config.cpp, installed together with the rest of the directory.
	# - output files
	# - - Make symlinks to (unversioned) /var

	# Doesn't build:
	sed -e '/autolabor2/d' \
		-e '/rprobe/d' \
		-i plugins/devel/CMakeLists.txt || die
}

src_configure() {
	# cmake -Wno-dev -LA .. | grep -v '^--' | sed -e 's/:\S*=/=/' -e 's/.*/"-D&"/'
	mycmakeargs=(
		#"-DBUILD_DEVEL=OFF"
		"$(cmake-utils_use_build api DEVEL)"
		#"-DBUILD_DEV_PLUGINS=OFF"
		"$(cmake-utils_use_build !minimal DEV_PLUGINS)"
		#"-DBUILD_DFUSION=ON"
		"$(cmake-utils_use_build dfusion DFUSION)"
		#"-DBUILD_DOXYGEN=OFF"
		"$(cmake-utils_use_build doc DOXYGEN)"
		#"-DBUILD_DWARFEXPORT=ON"
		"$(cmake-utils_use_build !minimal DWARFEXPORT)"
		#"-DBUILD_EGGY=OFF"
		"$(cmake-utils_use_build egg EGGY)"
		#"-DBUILD_ISOWORLD=OFF"
		"$(cmake-utils_use_build isoworld ISOWORLD)"
		"-DBUILD_LIBRARY=ON"
		#"-DBUILD_MAPEXPORT=ON"
		"$(cmake-utils_use_build !minimal MAPEXPORT)"
		"-DBUILD_PLUGINS=ON"
		"-DBUILD_RUBY=ON"
		"-DBUILD_SKELETON=OFF"
		#"-DBUILD_STONESENSE=OFF"
		"$(cmake-utils_use_build stonesense STONESENSE)"
		#"-DBUILD_SUPPORTED=ON"
		"$(cmake-utils_use_build !minimal SUPPORTED)"
		#"-DCMAKE_INSTALL_PREFIX=/usr/local"
		"-DCMAKE_INSTALL_PREFIX=${GAMES_DATADIR}"
		"-DCONSOLE_NO_CATCH=OFF"
		#"-DDFHACK_BINARY_DESTINATION=."
		"-DDFHACK_BINARY_DESTINATION=${GAMES_BINDIR}"
		#"-DDFHACK_DATA_DESTINATION=hack"
		"-DDFHACK_DATA_DESTINATION=${dfhack_datadir}"
		#"-DDFHACK_DEVDOC_DESTINATION=hack"
		"-DDFHACK_DEVDOC_DESTINATION=${dfhack_docdir}/dev"
		#"-DDFHACK_EGGY_DESTINATION=libs"
		"-DDFHACK_EGGY_DESTINATION=${dfhack_libdir}"
		#"-DDFHACK_INCLUDES_DESTINATION=hack/include"
		"-DDFHACK_INCLUDES_DESTINATION=${GAMES_PREFIX}/include"
		#"-DDFHACK_LIBRARY_DESTINATION=hack"
		"-DDFHACK_LIBRARY_DESTINATION=${dfhack_libdir}"
		#"-DDFHACK_LUA_DESTINATION=hack/lua"
		"-DDFHACK_LUA_DESTINATION=${dfhack_datadir}/lua"
		#"-DDFHACK_PLUGIN_DESTINATION=hack/plugins"
		"-DDFHACK_PLUGIN_DESTINATION=${dfhack_datadir}/plugins"
		#"-DDFHACK_RUBY_DESTINATION=hack/ruby"
		"-DDFHACK_RUBY_DESTINATION=${dfhack_datadir}/ruby"
		#"-DDFHACK_STATEDIR=."
		"-DDFHACK_STATEDIR=${GAMES_STATEDIR}/${P}"
		#"-DDFHACK_USERDOC_DESTINATION=hack"
		"-DDFHACK_USERDOC_DESTINATION=${dfhack_docdir}"
		#"-DDF_EXECUTABLE=./libs/Dwarf_Fortress"
		"-DDF_EXECUTABLE=${df_executable}"
		"-DDL_RUBY=OFF"
		"-DRUBYLIB=${WORKDIR}/libruby.so"
		"-DINSTALL_NEW_LIBSTDCXX=OFF"
		)
	#	"-DSSENSE_ALLEGRO_DESTINATION=${dfhack_libdir}"
	#	"-DSSENSE_RES_DESTINATION=${dfhack_datadir}/stonesense"
	#	"-DSSENSE_DOC_DESTINATION=${dfhack_docdir}/stonesense"

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

DOCS=""
src_install() {
	cmake-utils_src_install
	mv "${D%/}/${GAMES_BINDIR}/dfhack" \
		"${D%/}/${GAMES_BINDIR}/dfhack-${df_PV}" || die
	mv "${D%/}/${GAMES_BINDIR}/dfhack-run" \
		"${D%/}/${GAMES_BINDIR}/dfhack-run-${df_PV}" || die
	! use egg || mv "${D%/}/${GAMES_BINDIR}/egghack" \
		"${D%/}/${GAMES_BINDIR}/egghack-${df_PV}" || die
	rm -f "${D%/}/${dfhack_docdir}"/LICENSE || die
	dodir "${dfhack_statedir}"
	if use stonesense; then
		dodir "${GAMES_SYSCONFDIR#/}/${P}/stonesense"
		mv "${D%/}/${dfhack_datadir#/}/stonesense/init.txt" \
			"${D%/}/${GAMES_SYSCONFDIR#/}/${P}/stonesense/init.txt" || die
		dosym "${ROOT}${GAMES_SYSCONFDIR#/}/${P}/stonesense/init.txt" \
			"${dfhack_datadir#/}/stonesense/init.txt"
		elog
		elog "The Stonesense configuration file can be found at"
		elog "${GAMES_SYSCONFDIR#/}/${P}/stonesense/init.txt"
	fi
	prepgamesdirs
	fperms g+w "${dfhack_statedir}"
	# userpriv: portage user needs to be able to link:
	fperms o+rx "${dfhack_libdir}"
	use egg && fperms o+rx "${dfhack_libdir}"/libegg.so
}

pkg_postinst() {
	games_pkg_postinst
	elog
	elog "Due to Dwarf Fortress' special needs regarding working directory,"
	elog "specifying relative paths to DFHack plugins can give unintended results."
	elog
	elog "Your dfhack.init should be placed in \${HOME}/.dwarffortress-${df-PV}/ ,"
	elog "otherwise the example configuration will be used."
	elog
	if ! use egg; then
		elog "To start DFHack, please run dfhack-${df_PV}"
	else
		elog "To start DFHack, please run dwarffortress-${df_PV}"
	fi
}
