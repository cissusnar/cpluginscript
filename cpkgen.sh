#!/bin/bash

CPKGEN_VERSION="1.0"

CREATE=0
PACKAGE=0

while [ $# -gt 0 ]
do
    key="$1"
    case $key in
        -h|--help)
            echo -e "useage:\n"
            echo "create plugin:"
            echo -e "-c/--create project_name \nexp.: ./cpkgen.sh -c myProj"
            echo ""
            echo "package plugin:"
            echo -e "-p/--package project_name \nexp.: ./cpkgen.sh -p myProj.cplugin"
            exit 1
            ;;
        -c|--create)
            CREATE=1
            PROJ_NAME=$2
            shift
            ;;
        -p|--package)
            PACKAGE=1
            PROJ_NAME=$2
            shift
            ;;
        --default)
            DEFAULT=YES
            ;;
        *)
            echo "unknow arg"
            exit 1
            ;;
    esac
    shift
done

if [ $CREATE -eq 1 ] && [ $PACKAGE -eq 1 ]
then
    echo "can't both create and package"
    exit 1
fi

PLUGIN_NAME="${PROJ_NAME}.cplugin"

BUNDLE_ID=$(uuidgen | awk -F '-' '{print $1}')

INFO_FILE="plugin_name = \"developr\"\nplugin_bundle_id = \"com.developer.${BUNDLE_ID}\"\nplugin_desc = \"信息描述\"\nplugin_version = \"1.0\"\nplugin_author = \"http://clipber.com\"\ncpkgen_version = \"${CPKGEN_VERSION}\""

MAIN_FILE="function main(text)\n\t-- edit here\n\treturn text\nend"

if [ $CREATE -eq 1 ]
then
    echo "create plugin $PROJ_NAME in current dir"
    mkdir -p "$PLUGIN_NAME"
    echo -e $INFO_FILE > ${PLUGIN_NAME}/info.lua
    echo -e $MAIN_FILE > ${PLUGIN_NAME}/main.lua
fi


if [ $PACKAGE -eq 1 ]
then
    PLUGIN_NAME=$(basename -s .cplugin $PROJ_NAME)
    PLUGIN_DIR="${PLUGIN_NAME}.cplugin"
    rm -rf Payload "${PLUGIN_NAME}.cpk"
    mkdir -p Payload
    cp -a $PLUGIN_DIR Payload/
    zip -r -1 "${PLUGIN_NAME}.cpk" Payload
    rm -rf Payload
fi

