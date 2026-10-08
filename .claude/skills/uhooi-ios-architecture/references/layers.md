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
├── App/                             … Xcodeプロジェクト（最低限のみ）
│   ├── {環境名}.xcodeproj            … 環境の数だけ作る
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

String(localized: "Sakatsu list", bundle: .module)
```
