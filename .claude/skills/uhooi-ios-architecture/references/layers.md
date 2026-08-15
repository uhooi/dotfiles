# 4層とモジュール分割

UiAではアプリを `Apps` ・ `Features` ・ `Data` ・ `Core` の4層に分けます。

参考: [Guide to Android app modularization](https://developer.android.com/topic/modularization)

## 大前提

- できる限りSwiftパッケージにソースコードを寄せる
- Xcodeプロジェクトには最低限のファイルのみ含める（ `@main` の構造体、Assets、Info.plistなど）

Xcodeプロジェクトにコードを置くと、ビルドが遅くなり、モジュール間の依存も管理できません。

## ディレクトリ構成

```
{アプリ名}/
├── App/                              … Xcodeプロジェクト（最低限のみ）
│   ├── {環境名}.xcodeproj          … 環境の数だけ作る
│   └── {アプリ名}/
│       └── {環境名}/{環境名}App.swift
├── {アプリ名}Package/                … ソースコードのほぼすべて
│   ├── Package.swift
│   ├── Sources/
│   │   ├── Apps/{環境名}/
│   │   ├── Features/{機能名}/
│   │   ├── Data/{機能名}/
│   │   └── Core/{機能名}/
│   └── Tests/
│       ├── Features/{機能名}Tests/
│       ├── Data/{機能名}Tests/
│       └── Core/{機能名}Tests/
└── {アプリ名}.xcworkspace
```

## 各層のルール

### Apps

- アプリのエントリポイント。ルートナビゲーションロジックを置く
- 基本的にすべてのFeatureモジュールに依存する
- **Dataモジュールに依存してはいけない**
- Coreモジュールに依存していい

参考: [App modules](https://developer.android.com/topic/modularization/patterns#app-modules)

アプリは必要な環境の数だけ作ります。 `.xcodeproj` も環境ごとに用意します。

Lokiでは3つ作っています。

| モジュール | 用途 |
| --- | --- |
| `ProductionApp` | 本番用 |
| `DevelopApp` | 開発用。デバッグ機能を追加で載せる |
| `CatalogApp` | [Playbook](https://github.com/playbook-ui/playbook-ios) でビューを一覧するカタログ |

### Features

- 各機能の画面（Screen・View・ViewModel）を置く
- **Appモジュールに依存してはいけない**
- **ほかのFeatureモジュールに依存してはいけない**
- DataやCoreモジュールに依存していい

参考: [Feature modules](https://developer.android.com/topic/modularization/patterns#feature-modules)

Feature同士が依存できないため、画面遷移はクロージャで親（Apps）へ伝えます。詳しくは [ui-layer.md](ui-layer.md) の「画面遷移」を読んでください。

### Data

- リポジトリ・データソース・モデル・バリデータを置く
- **AppやFeatureモジュールに依存してはいけない**
- できる限りほかのDataモジュールに依存しない
- Coreモジュールに依存していい

参考: [Data modules](https://developer.android.com/topic/modularization/patterns#data-modules)

### Core

- 複数のモジュールが共通で使う処理を置く
- **AppやFeature、Dataモジュールに依存してはいけない**
- ほかのCoreモジュールに依存していい

参考: [Common modules](https://developer.android.com/topic/modularization/patterns#common-modules)

Lokiでは次の3つを用意しています。

| モジュール | 中身 |
| --- | --- |
| `LogCore` | `os.Logger` のラッパー。全モジュールが依存する |
| `UICore` | `errorAlert()` などSwiftUIの共通拡張 |
| `UserDefaultsCore` | UserDefaultsのクライアント |

## モジュールの命名

| 層 | ターゲット名 | ディレクトリ |
| --- | --- | --- |
| Apps | `{環境名}App` | `Sources/Apps/{環境名}/` |
| Features | `{機能名}Feature` | `Sources/Features/{機能名}/` |
| Data | `{機能名}Data` | `Sources/Data/{機能名}/` |
| Core | `{機能名}Core` | `Sources/Core/{機能名}/` |

ターゲット名と `path` は必ず両方書きます。 `path` を省略するとディレクトリ名とターゲット名を揃える必要があり、上の構成にできません。

## Package.swift の書き方

Lokiの `Package.swift` には、暗黙のルールが3つあります。

### 1. 全ターゲットに同じSwift設定を適用する

ファイル末尾のループでまとめて設定します。ターゲットごとに書きません。

```swift
for target in package.targets {
    target.swiftSettings = swiftSettings

    if target.name != "LogCore" {
        target.dependencies.append("LogCore")
    }
}
```

### 2. LogCoreは全ターゲットが依存する

ログはどこでも使うため、上のループで自動的に足します。 `dependencies` に手で書きません。

### 3. Upcoming Featureを積極的に有効化する

```swift
let swiftSettings: [PackageDescription.SwiftSetting] = [
    .unsafeFlags(debugOtherSwiftFlags, .when(configuration: .debug)),
    .enableUpcomingFeature("ExistentialAny"), // SE-0335
    .enableUpcomingFeature("InternalImportsByDefault"), // SE-0409
    .enableUpcomingFeature("MemberImportVisibility"), // SE-0444
    .enableUpcomingFeature("InferIsolatedConformances"), // SE-0470
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"), // SE-0461
    .enableUpcomingFeature("ImmutableWeakCaptures"), // SE-0481
]
```

デバッグビルドでは、型チェックが遅い箇所と競合を検知するフラグも付けます。

```swift
let debugOtherSwiftFlags = [
    "-Xfrontend", "-warn-long-expression-type-checking=500",
    "-Xfrontend", "-warn-long-function-bodies=500",
    "-strict-concurrency=complete",
    "-enable-actor-data-race-checks",
]
```

`InternalImportsByDefault` を有効にしているため、モジュールの外へ型を公開するときは `package import` や `public import` を書きます。詳しくは [coding-rules.md](coding-rules.md) を読んでください。

## リソース

- `Localizable.xcstrings` はモジュールごとに `Sources/{層}/{機能名}/Resources/` へ置く
- 文字列は必ず `bundle: .module` を付けて参照する

```swift
Text("Sakatsu list", bundle: .module)
String(localized: "Sakatsu list", bundle: .module)
```
