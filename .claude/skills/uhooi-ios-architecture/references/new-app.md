# 新規アプリの基盤を作る

UiAに則った新しいiOSアプリの土台を作る手順です。 `{アプリ名}` は作るアプリの名前に読み替えてください。

## できあがり

```
{アプリ名}/
├── App/
│   ├── {環境名}.xcodeproj          … 環境の数だけ作る
│   └── {アプリ名}/
│       └── {環境名}/{環境名}App.swift
├── {アプリ名}Package/
│   ├── Package.swift
│   ├── Sources/
│   │   ├── Apps/{環境名}/
│   │   ├── Features/
│   │   ├── Data/
│   │   └── Core/{Log,UI}/
│   └── Tests/
└── {アプリ名}.xcworkspace
```

ビルドやLintの仕組み（Makefile、Mint、SwiftLintなど）はUiAの範囲外です。好きなものを使ってください。

## 手順

### 1. Swiftパッケージを作る

`{アプリ名}Package/Package.swift` を作ります。

```swift
// swift-tools-version: 6.3

import PackageDescription

let productionFeatures: [PackageDescription.Target.Dependency] = [
    // ここにFeatureモジュールを足していく
]

// MARK: - Package

let package = Package(
    name: "{アプリ名}Package",
    defaultLocalization: "ja",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "Production", targets: ["ProductionApp"]),
        .library(name: "Develop", targets: ["DevelopApp"]),
        .library(name: "Catalog", targets: ["CatalogApp"]),
    ],
    dependencies: [
        // Libraries
        .package(url: "https://github.com/playbook-ui/playbook-ios.git", from: "0.4.1"),
    ],
    targets: [
        // App layer
        .target(
            name: "ProductionApp",
            dependencies: productionFeatures,
            path: "./Sources/Apps/Production",
        ),
        .target(
            name: "DevelopApp",
            dependencies: productionFeatures,
            path: "./Sources/Apps/Develop",
        ),
        .target(
            name: "CatalogApp",
            dependencies: productionFeatures + [
                "UICore",
                .product(name: "Playbook", package: "playbook-ios"),
                .product(name: "PlaybookUI", package: "playbook-ios"),
            ],
            path: "./Sources/Apps/Catalog",
        ),

        // Feature layer

        // Data layer

        // Core layer
        .target(
            name: "LogCore",
            dependencies: [],
            path: "./Sources/Core/Log",
        ),
        .target(
            name: "UICore",
            dependencies: [],
            path: "./Sources/Core/UI",
        ),
    ]
)

for target in package.targets {
    if target.name != "LogCore" {
        target.dependencies.append("LogCore")
    }
}
```

### 2. Core層を作る

最初から必要なのは2つです。

`Sources/Core/Log/Logger.swift`

```swift
import Foundation
package import struct os.Logger

package enum Logger {
    package static let standard: os.Logger = .init(
        subsystem: Bundle.main.bundleIdentifier!,
        category: LogCategory.standard.rawValue,
    )
}

// MARK: - Privates

private enum LogCategory: String {
    case standard = "Standard"
}
```

`Sources/Core/UI/Extensions/View+Alert.swift`

```swift
package import SwiftUI

extension View {
    /// - Important: After this alert disappears, should set `error`  to `nil`
    package func errorAlert(
        error: (some LocalizedError)?,
        onDismiss: @escaping () -> Void,
    ) -> some View {
        alert(
            isPresented: .init(get: {
                error != nil
            }, set: { _ in
                onDismiss()
            }),
            error: error,
        ) { _ in
        } message: { error in
            Text((error.failureReason ?? "") + (error.recoverySuggestion ?? ""))
        }
    }
}
```

データを永続化するなら `UserDefaultsCore` も作ります。中身は [data-layer.md](data-layer.md) を見てください。

### 3. Apps層を作る

`Sources/Apps/Production/ProductionRootScreen.swift`

```swift
public import SwiftUI

public struct ProductionRootScreen: View {
    public var body: some View {
        NavigationStack {
            // 最初の画面
        }
    }

    public init() {}
}

// MARK: - Screen factory

private extension ProductionRootScreen {
}
```

`Develop` も同じ形で作ります。デバッグ用の画面はここだけに載せます。

`Catalog` は [Playbook](https://github.com/playbook-ui/playbook-ios) を使います。

```swift
public import SwiftUI
import PlaybookUI

public struct CatalogRootScreen: View {
    public var body: some View {
        PlaybookScreen()
    }

    public init() {
        Playbook.default.add(AllScenarios.self)
    }
}
```

### 4. Xcodeプロジェクトを作る

Xcodeで環境の数だけプロジェクトを `App/` に作ります。各プロジェクトには次のファイルだけを置きます。

- `{環境名}App.swift`
- `Resources/Assets.xcassets`
- `Resources/PrivacyInfo.xcprivacy`
- `Resources/{環境名}.entitlements`

`{環境名}App.swift` は最小限にします。

```swift
import SwiftUI
import ProductionApp

@main
struct ProductionApp: App {
    var body: some Scene {
        WindowGroup {
            ProductionRootScreen()
        }
    }
}
```

各プロジェクトに `{アプリ名}Package` をローカルパッケージとして追加し、対応するライブラリをリンクします。

### 5. ワークスペースを作る

`{アプリ名}.xcworkspace` を作り、すべてのプロジェクトと `{アプリ名}Package` を入れます。

### 6. 最初の画面を作る

`scripts/new-screen.sh` でテンプレートを生成します。

```shell
$ .claude/skills/uhooi-ios-architecture/scripts/new-screen.sh Home {アプリ名}Package/Sources/Features/Home
```

`Package.swift` にFeatureモジュールとテストターゲットを足します。

```swift
.target(
    name: "HomeFeature",
    dependencies: [
        "UICore",
    ],
    path: "./Sources/Features/Home",
),
.testTarget(
    name: "HomeFeatureTests",
    dependencies: ["HomeFeature"],
    path: "./Tests/Features/HomeTests",
),
```

`productionFeatures` にも `"HomeFeature"` を足し、Apps層のルート画面から呼びます。

### 7. ビルドできることを確認する

Xcodeでワークスペースを開き、ビルドして起動します。

## チェックリスト

- [ ] ソースコードがSwiftパッケージに寄っている
- [ ] Xcodeプロジェクトには `@main` の構造体とリソースしかない
- [ ] 必要な環境の数だけアプリがある
- [ ] 4層のディレクトリがある
- [ ] LogCoreに全ターゲットが依存している
- [ ] ビルドが通る
