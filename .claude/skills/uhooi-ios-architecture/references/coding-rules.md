# コーディングルール

## 全体

- できる限り [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) に従う
- できる限り `any` より `some` を使う
    - 引数は `some` で受ける
    - プロパティに持つときは `any` になる
- 引数が複数行なら、最後の引数のあとにもカンマを付ける（trailing comma）

```swift
private init(
    userDefaultsClient: some UserDefaultsClient = DefaultUserDefaultsClient.shared,
)
```

## 命名

| 対象 | 命名 | 例 |
| --- | --- | --- |
| 親ビュー | `{画面名}Screen` | `SakatsuListScreen` |
| 子ビュー | `{画面名}View` | `SakatsuListView` |
| さらに子のビュー | `{部品名}View` | `SakatsuRowView` |
| ビューモデル | `{画面名}ViewModel` | `SakatsuListViewModel` |
| UIの状態 | `{画面名}UiState` | `SakatsuListUiState` |
| エラー | `{画面名}Error` | `SakatsuListError` |
| アクション | `{画面名}{Screen/View}Action` | `SakatsuListViewAction` |
| 非同期アクション | `{画面名}{Screen/View}AsyncAction` | `SakatsuListScreenAsyncAction` |
| リポジトリ | `{名前}Repository` / `Default{名前}Repository` | `SakatsuRepository` |
| データソース | `{名前}{保存先}DataSource` | `SakatsuUserDefaultsDataSource` |
| バリデータ | `{名前}Validator` / `Default{名前}Validator` | `SakatsuValidator` |

- `UiState` は `UIState` と書かない（Android由来の綴り）
- プロトコルに対する標準の実装は `Default` を付ける
- 1ファイル1型ではない。関係する型（アクション・UI state・エラー）は同じファイルにまとめる

## アクセス修飾子

Swiftパッケージのため、 `public` はほとんど使いません。

| 修飾子 | 使う場所 |
| --- | --- |
| 何も付けない（internal） | モジュールの中だけで使うもの。子ビュー、データソースなど |
| `package` | 同じパッケージのほかのモジュールへ公開するもの。Screen、リポジトリ、モデルなど |
| `public` | Apps層のルート画面のみ（Xcodeプロジェクトから使うため） |

- できる限り狭くする。迷ったらinternalから始める
- `InternalImportsByDefault` を有効にしているため、公開する型で使うモジュールは `package import` や `public import` にする

```swift
package import SwiftUI   // package な View を定義するファイル
public import SwiftUI    // public な View を定義するファイル
import SwiftUI           // internal な View を定義するファイル
```

## MARKコメント

ファイルの先頭から順に並べます。最初のMARKには `-` を付けず、2つ目以降に付けます。

### ビューのファイル

```swift
// MARK: Actions
// MARK: - View
// MARK: - Privates
// MARK: - Previews   ← #if DEBUG の中
```

### ビューモデルのファイル

```swift
// MARK: UI state
// MARK: - Actions
// MARK: - Error
// MARK: - View model
// MARK: - Privates
```

### Apps層のファイル

```swift
// MARK: - Screen factory
```

## ログ

- `os.Logger` をラップした `LogCore` の `Logger` を使う
- 出す場所は2つだけ
    - ビューの `init`
    - ビューモデルの `send()` ・ `sendAsync()`

```swift
Logger.standard.debug("\(#function, privacy: .public)")
```

```swift
let message = "\(#function) action: \(action)"
Logger.standard.debug("\(message, privacy: .public)")
```

`privacy: .public` を付けないと、実機のログで文字列が伏せられます。

## ローカライズ

- 文言は `Localizable.xcstrings` に書く。モジュールごとに用意する
- 参照するときは必ず `bundle: .module` を付ける

```swift
Text("Sakatsu list", bundle: .module)
Text("\(count) Sakatsu(s)", bundle: .module)
String(localized: "Save", bundle: .module)
```

- `Text` に直接渡せるところは `Text("...", bundle: .module)` を使う
- 文字列が必要なところ（ `navigationTitle` 、 `accessibilityLabel` など）は `String(localized:bundle:)` を使う

## アクセシビリティ

SwiftLintの `accessibility_label_for_image` と `accessibility_trait_for_button` を有効にしています。

- 画像だけのボタンには `.accessibilityLabel(...)` を付ける

```swift
Button(action: onAddButtonClick) {
    Image(systemName: "plus")
}
.accessibilityLabel(String(localized: "New Sakatsu", bundle: .module))
```

## OSバージョンでの分岐

新しいAPIを使うときは `if #available` で分けます。ビューの分岐を避けるため、ツールバーなど `private extension` のメソッドの中に閉じ込めます。

```swift
@ToolbarContentBuilder
func toolbarContent(...) -> some ToolbarContent {
    if #available(iOS 26.0, *) {
        ...
    } else {
        ...
    }
}
```

## デバッグ専用のコード

- プレビューは `#if DEBUG` で囲む
- デバッグ専用の画面や機能は `#if DEBUG` で囲む。 `init` の引数も分ける

```swift
#if DEBUG
package init(
    onLicensesButtonClick: @escaping () -> Void,
    onDebugButtonClick: @escaping () -> Void,
) { ... }
#else
package init(
    onLicensesButtonClick: @escaping () -> Void,
) { ... }
#endif
```

## SwiftLint

- Mintで管理する
- `make lint` で実行、 `make fix` で自動修正する
- 意図的に無視するときは、行末に `// swiftlint:disable:this {ルール名}` を付ける
    - よく使うもの
        - `@Environment` のプロパティ → `attributes`
        - 長い `send()` → `cyclomatic_complexity function_body_length`

無効にしているルールと、その理由は `.swiftlint.yml` にコメントで書きます。

```yaml
disabled_rules:
  - todo  # TODOコメントで警告を増やしたくないため
  - trailing_comma  # 末尾にカンマを付けたいことがあるため
```

## ビルドと確認

Swiftのコードを変更したら、必ず次を実行します。

```shell
$ make lint && make build-debug-develop
```
