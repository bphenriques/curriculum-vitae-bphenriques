#!/bin/sh
#
# Simplified script to display the next semversion.
#
# Reference:
# - https://semver.org/
 

RE='[^0-9]*\([0-9]*\)[.]\([0-9]*\)[.]\([0-9]*\)\([0-9A-Za-z-]*\)'

usage () {
   echo "./next-semver.sh [--version <semversion>] --mode [major|minor|patch]"
}

version=$(git tag --sort=committerdate 2>/dev/null | tail -n 1)
while [ "$1" != "" ]; do
    case $1 in
        --version )             shift
				version="$1"
                                ;;
        --mode )      shift
                                mode="$1"
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

[ -z "$mode" ] && usage && exit 1

next_semver () {
   version="$1"
   mode="$2"

   major=$(echo "${version}" | sed -e "s#$RE#\1#")
   minor=$(echo "${version}" | sed -e "s#$RE#\2#")
   patch=$(echo "${version}" | sed -e "s#$RE#\3#")

   case "$mode" in
      major)  major=$((major+1))
              ;;
      minor)  minor=$((minor+1))
              ;;
      patch)  patch=$((patch+1))
              ;;
      *)      usage
              exit 1
   esac

   echo "$major.$minor.$patch"
}

next_semver "$version" "$mode"

