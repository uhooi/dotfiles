# コーディングルール

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

- SwiftUIのコンポーネントを少しいじっただけの部品は、 `{部品名}Label` や `{部品名}Text` と名付けてもいい
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

ファイルの先頭から順に並べます。すべてのMARKに `-` を付けます。

### ビューのファイル

```swift
// MARK: - Actions
// MARK: - View
// MARK: - Privates
// MARK: - Previews   ← #if DEBUG の中
```

### ビューモデルのファイル

```swift
// MARK: - UI state
// MARK: - Actions
// MARK: - Error
// MARK: - View model
// MARK: - Privates
```

### Apps層のファイル

```swift
// MARK: - Screen factory
```

## OSバージョンでの分岐

ビューに分岐を書かないルールがあるため、 `if #available` は `private extension` のメソッドの中に閉じ込めます。

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

## 補足: UiA以外のルール

ここから下はUiAの一部ではありません。Lokiで採用しているだけなので、必要に応じて取り入れてください。

- できる限り [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) に従う
- できる限り `any` より `some` を使う（引数は `some` で受け、プロパティは `any` で持つ）
- 引数が複数行なら、最後の引数のあとにもカンマを付ける（trailing comma）
- ログは必要に応じて出す。 `send()` の先頭に1行書くと、その画面のイベントをすべて追える
- 画像だけのボタンには `.accessibilityLabel(...)` を付ける
