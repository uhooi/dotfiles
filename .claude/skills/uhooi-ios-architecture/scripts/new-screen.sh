#!/bin/bash
#
# UiAの画面（Screen + View + ViewModel）を作る
#
# Usage:
#   new-screen.sh <画面名> <置き先のディレクトリ>
#
# Example:
#   new-screen.sh SakatsuList LokiPackage/Sources/Features/Sakatsu
#     -> LokiPackage/Sources/Features/Sakatsu/SakatsuList/SakatsuListScreen.swift
#        LokiPackage/Sources/Features/Sakatsu/SakatsuList/SakatsuListView.swift
#        LokiPackage/Sources/Features/Sakatsu/SakatsuList/SakatsuListViewModel.swift

set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: $(basename "$0") <画面名> <置き先のディレクトリ>" >&2
  echo "Example: $(basename "$0") SakatsuList LokiPackage/Sources/Features/Sakatsu" >&2
  exit 1
fi

screen_name="$1"
dest_root="$2"

if ! [[ "${screen_name}" =~ ^[A-Z][A-Za-z0-9]*$ ]]; then
  echo "画面名はUpperCamelCaseで指定してください: ${screen_name}" >&2
  exit 1
fi

if [ ! -d "${dest_root}" ]; then
  echo "ディレクトリがありません: ${dest_root}" >&2
  exit 1
fi

script_dir_path=$(cd "$(dirname "$0")" && pwd)
template_dir_path="${script_dir_path}/../assets/UiA Screen.xctemplate"
dest_dir_path="${dest_root}/${screen_name}"

if [ -d "${dest_dir_path}" ]; then
  echo "すでに存在します: ${dest_dir_path}" >&2
  exit 1
fi

# 先頭を小文字にする
lower_screen_name="$(echo "${screen_name:0:1}" | tr '[:upper:]' '[:lower:]')${screen_name:1}"

mkdir -p "${dest_dir_path}"

for suffix in Screen View ViewModel; do
  sed \
    -e "s/___FILEBASENAMEASIDENTIFIER___/${screen_name}/g" \
    -e "s/___VARIABLE_screenName___/${lower_screen_name}/g" \
    "${template_dir_path}/___FILEBASENAME___${suffix}.swift" \
    > "${dest_dir_path}/${screen_name}${suffix}.swift"

  echo "created: ${dest_dir_path}/${screen_name}${suffix}.swift"
done

echo ""
echo "次にやること:"
echo "  1. '// TODO:' のコメントを埋める"
echo "  2. 使わないもの（ツールバー、エラーなど）を消す"
echo "  3. Localizable.xcstrings に文言を足す"
echo "  4. Apps層のルート画面から呼ぶ"
echo "  5. ビルドして動きを確認する"
