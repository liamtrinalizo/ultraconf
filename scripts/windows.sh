#!/bin/bash

VS2005=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 8/Common7/IDE/devenv
VS2008=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 9.0/Common7/IDE/devenv
VS2010=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 10.0/Common7/IDE/devenv
VS2013=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/Common7/IDE/devenv
VS2015=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv

show_error() {
    sed "s/error/$(printf "\033[31mERROR\033[0m")/I"
}

while getopts "bsiuz:" opt; do
    case $opt in
        b)
            echo -e "\033[32mCompiling driver...\033[m"
            ./CmpSYSx86_RELEASE.bat   |& show_error
            ./CmpSYSAMD64_RELEASE.bat |& show_error
            ./CmpSYSAMD64_RELEASE.bat |& show_error
            ./CmpDLLSln.bat           |& show_error
            ./CmpPROPDLLSln.bat       |& show_error
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
        u)
            echo -e "\033[32mUploading driver...\033[m"
            if [ ! -d "/cygdrive/y" ]; then
                net use y: '\\test09-win7\Desktop'
            fi
            rm -fr /cygdrive/y/INF_SIGN 
            cp -r INF_SIGN /cygdrive/y/ ;;
        z)
            echo -e "\033[32mDirect compile...\033[m"
            VERSION=$(grep -Eo "Version [0-9]+" "$OPTARG")
            echo $VERSION
            case "$VERSION" in
                "Version 6" | "Version 8")
                    echo VS2005
                    "$VS2005" /Rebuild "Release|Win32" "$OPTARG" ;;
                "Version 9")
                    echo VS2008
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
            echo "usage windows.sh -bsiuz [-s VISUAL_VERS]" ;;

        esac
    done


