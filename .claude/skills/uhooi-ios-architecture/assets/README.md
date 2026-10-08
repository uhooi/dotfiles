# テンプレート

UiAの画面を作るためのテンプレートです。Xcodeのファイルテンプレートの形式で置いています。

| テンプレート | 作られるファイル |
| --- | --- |
| `UiA Screen.xctemplate` | `{画面名}Screen.swift` ・ `{画面名}View.swift` ・ `{画面名}ViewModel.swift` |
| `UiA Subview.xctemplate` | `{部品名}View.swift` （ `Subviews/` に置く） |

## Xcodeから作る

1. テンプレートをXcodeが読む場所に置く（1回だけ）

    ```shell
    $ mkdir -p ~/Library/Developer/Xcode/Templates/File\ Templates/UiA
    $ ln -fns ~/.claude/skills/uhooi-ios-architecture/assets/UiA\ Screen.xctemplate ~/Library/Developer/Xcode/Templates/File\ Templates/UiA/
    $ ln -fns ~/.claude/skills/uhooi-ios-architecture/assets/UiA\ Subview.xctemplate ~/Library/Developer/Xcode/Templates/File\ Templates/UiA/
    ```

2. Xcodeで File > New > File... を開き、「UiA」の中から選ぶ
3. ファイル名に画面名（例: `SakatsuList` ）を入れる

`___FILEBASENAME___` にファイル名が入るため、3ファイルがまとめて作られます。

## コマンドから作る

Xcodeを開かずに作るときは、スクリプトを使います。

```shell
$ .claude/skills/uhooi-ios-architecture/scripts/new-screen.sh SakatsuList LokiPackage/Sources/Features/Sakatsu
```

引数は画面名（UpperCamelCase）と、置き先のディレクトリです。 `{置き先}/{画面名}/` に3ファイルを作ります。

## 作ったあとにやること

1. `// TODO:` のコメントを埋める
2. 使わないもの（ツールバー、エラーなど）は消す
    - 状態がまったくない画面でも、ViewとViewModelは残す
3. `Localizable.xcstrings` に文言を足す
4. Apps層のルート画面から呼ぶ
5. ビルドして動きを確認する
