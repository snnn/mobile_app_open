#!/usr/bin/env bash
set -euo pipefail

version="${1:?protoc version required}"
dest_dir="${2:?destination directory required}"

if [[ -x "${dest_dir}/bin/protoc" ]]; then
  exit 0
fi

uname_s="$(uname -s)"
uname_m="$(uname -m)"
platform=""
case "${uname_s}" in
  Linux)
    if [[ "${uname_m}" == "aarch64" || "${uname_m}" == "arm64" ]]; then
      platform="linux-aarch_64"
    else
      platform="linux-x86_64"
    fi
    ;;
  Darwin)
    if [[ "${uname_m}" == "arm64" ]]; then
      platform="osx-aarch_64"
    else
      platform="osx-x86_64"
    fi
    ;;
  MINGW*|MSYS*|CYGWIN*)
    platform="win64"
    ;;
  *)
    echo "Unsupported OS: ${uname_s}" >&2
    exit 1
    ;;
esac

download_version="${version}"
if [[ "${version}" =~ ^3\.21\.([0-9]+)$ ]]; then
  download_version="21.${BASH_REMATCH[1]}"
fi

url="https://github.com/protocolbuffers/protobuf/releases/download/v${download_version}/protoc-${download_version}-${platform}.zip"
tmp_dir="$(mktemp -d)"
cleanup() { rm -rf "${tmp_dir}"; }
trap cleanup EXIT

mkdir -p "${dest_dir}"
curl --fail --location --silent --show-error "${url}" -o "${tmp_dir}/protoc.zip"
rm -rf "${dest_dir:?}/"*
unzip -q "${tmp_dir}/protoc.zip" -d "${dest_dir}"
