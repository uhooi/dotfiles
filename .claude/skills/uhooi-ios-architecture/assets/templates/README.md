# テンプレート

UiAの画面を作るためのテンプレートです。

| ファイル | 用途 |
| --- | --- |
| `__SCREEN_NAME__Screen.swift` | 親ビュー |
| `__SCREEN_NAME__View.swift` | 子ビュー |
| `__SCREEN_NAME__ViewModel.swift` | ビューモデル |
| `__SUBVIEW_NAME__View.swift` | さらに小さい子ビュー（ `Subviews/` に置く） |

## 使い方

`scripts/new-screen.sh` を使うのが速いです。

```shell
$ .claude/skills/uhooi-ios-architecture/scripts/new-screen.sh SakatsuList LokiPackage/Sources/Features/Sakatsu
```

手で作るときは、ファイルをコピーして次のように置き換えてください。

| プレースホルダ | 置き換えるもの | 例 |
| --- | --- | --- |
| `__SCREEN_NAME__` | 画面名（UpperCamelCase） | `SakatsuList` |
| `__screenName__` | 画面名の先頭を小文字にしたもの | `sakatsuList` |
| `__SUBVIEW_NAME__` | 部品名（UpperCamelCase） | `SakatsuRow` |

## 作ったあとにやること

1. `// TODO:` のコメントを埋める
2. 使わないもの（ツールバー、エラーなど）は消す
3. 状態がまったくない画面なら、ViewとViewModelを消してScreenだけにする
4. `Localizable.xcstrings` に文言を足す
5. Apps層のルート画面から呼ぶ
6. `make lint && make build-debug-develop` で確認する
