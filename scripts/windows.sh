#!/bin/sh

VS2005=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 8/Common7/IDE/devenv
VS2008=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 9.0/Common7/IDE/devenv
VS2010=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 10.0/Common7/IDE/devenv
VS2013=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/Common7/IDE/devenv
VS2015=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv

show_usage() {
    echo -e  "Usage windows.sh -bsiu [-z *.sln]\n" \
             "-b \033[1;33mb\033[0muild driver in release\n" \
             "-d \033[1;33md\033[0mebug build driver\n" \
             "-s build \033[1;33ms\033[0mamples scripts\n" \
             "-i s\033[1;33mi\033[0mgn driver\n" \
             "-z compile through sln\n"
}

show_error() {
	sed -e "s/\([^0]\) error/\1 $(printf "\033[31mERROR\033[0m")/I" -e "s/\([^0]\) warning/\1 $(printf "\033[33mWARNING\033[0m")/I"
}

[ -z "$1" ] && show_usage

while getopts "bdsiz:" opt; do
    case $opt in
        b)
            echo -e "\033[32mCompiling driver...\033[m"
            ./CmpSYSx86_RELEASE.bat   |& show_error
            ./CmpSYSAMD64_RELEASE.bat |& show_error
            ./CmpDLLSln.bat           |& show_error
            ./CmpPROPDLLSln.bat       |& show_error
            [ -f CmpCompatibleDLLSln.bat ] \
				&& ./CmpCompatibleDLLSln.bat |& show_error
            ;;
        d)
            echo -e "\033[32mCompiling driver...\033[m"
            ./CmpSYSx86_DEBUG.bat     |& show_error
            ./CmpSYSAMD64_DEBUG.bat   |& show_error
            ./CmpDLLSln.bat           |& show_error
            ./CmpPROPDLLSln.bat       |& show_error
            [ -f CmpCompatibleDLLSln.bat ] \
				&& ./CmpCompatibleDLLSln.bat |& show_error
            ;;
        s)
            echo -e "\033[32mCompiling sample...\033[m"
            ./CmpAppSln.bat       |& show_error
            ./CmpCSharpAppSln.bat |& show_error
            ./CmpAssemblySln.bat  |& show_error
            ;;
        i)
            echo -e "\033[32mSigning driver...\033[m"
            ./CmpGenerateSignedINF.bat |& show_error
            ;;
        z)
            echo -e "\033[32mDirect compile...\033[m"
            VERSION=$(grep -Eo "Version [0-9]+" "$OPTARG")
            echo $VERSION
            case "$VERSION" in
                "Version 6" | "Version 8" | "VS2008")
                    echo VS2005
                    "$VS2005" /Rebuild "Release|Win32" "$OPTARG" ;;
                "Version 9")
                    echo VS2008
                    echo "$VS2008" /Rebuild "Release|Win32" "$OPTARG"
                    "$VS2008" /Rebuild "Release|Win32" "$OPTARG" ;;
                "Version 10" | "Version 11")
                    echo VS2010
                    "$VS2010" /Rebuild "Release|Win32" "$OPTARG" ;;
                "Version 12")
                    echo VS2012
                    "$VS2013" /Rebuild "Release|Win32" "$OPTARG" ;;
            esac
            ;;
        ?)
            show_usage
            ;;
    esac
done


