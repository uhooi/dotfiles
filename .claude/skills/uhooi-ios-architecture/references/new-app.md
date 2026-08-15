# 新規アプリの基盤を作る

UiAに則った新しいiOSアプリの土台を作る手順です。 `{アプリ名}` は作るアプリの名前に読み替えてください。

## できあがり

```
{アプリ名}/
├── App/
│   ├── Production.xcodeproj
│   ├── Develop.xcodeproj
│   ├── Catalog.xcodeproj
│   └── {アプリ名}/
│       ├── Production/ProductionApp.swift
│       ├── Develop/DevelopApp.swift
│       └── Catalog/CatalogApp.swift
├── {アプリ名}Package/
│   ├── Package.swift
│   ├── Sources/
│   │   ├── Apps/{Production,Develop,Catalog}/
│   │   ├── Features/
│   │   ├── Data/
│   │   └── Core/{Log,UI}/
│   └── Tests/
├── {アプリ名}.xcworkspace
├── Makefile
├── Mintfile
├── .swiftlint.yml
├── .editorconfig
├── .gitignore
└── README.md
```

## 手順

### 1. Swiftパッケージを作る

`{アプリ名}Package/Package.swift` を作ります。

```swift
// swift-tools-version: 6.3

import PackageDescription

let debugOtherSwiftFlags = [
    "-Xfrontend", "-warn-long-expression-type-checking=500",
    "-Xfrontend", "-warn-long-function-bodies=500",
    "-strict-concurrency=complete",
    "-enable-actor-data-race-checks",
]

let swiftSettings: [PackageDescription.SwiftSetting] = [
    .unsafeFlags(debugOtherSwiftFlags, .when(configuration: .debug)),
    .enableUpcomingFeature("ExistentialAny"), // SE-0335
    .enableUpcomingFeature("InternalImportsByDefault"), // SE-0409
    .enableUpcomingFeature("MemberImportVisibility"), // SE-0444
    .enableUpcomingFeature("InferIsolatedConformances"), // SE-0470
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"), // SE-0461
    .enableUpcomingFeature("ImmutableWeakCaptures"), // SE-0481
]

let productionFeatures: [PackageDescription.Target.Dependency] = [
    // ここにFeatureモジュールを足していく
]

// MARK: Package

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
    target.swiftSettings = swiftSettings

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

Xcodeで `Production` ・ `Develop` ・ `Catalog` の3つのプロジェクトを `App/` に作ります。各プロジェクトには次のファイルだけを置きます。

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

`{アプリ名}.xcworkspace` を作り、3つのプロジェクトと `{アプリ名}Package` を入れます。

### 6. Makefileを作る

よく使うターゲットです。

```makefile
product_name := {アプリ名}
workspace_name := $(product_name).xcworkspace
package_name := $(product_name)Package

TEST_SDK := iphonesimulator
TEST_CONFIGURATION := Debug
TEST_PLATFORM := iOS Simulator
TEST_DESTINATION := 'generic/platform=$(TEST_PLATFORM)'

MINT := mint
SWIFTLINT := $(MINT) run realm/SwiftLint swiftlint

MINT_ROOT := ./.mint
export MINT_PATH := $(MINT_ROOT)/lib
export MINT_LINK_PATH := $(MINT_ROOT)/bin

.PHONY: setup
setup:
	$(MAKE) install-mint-dependencies
	$(MAKE) open

.PHONY: install-mint-dependencies
install-mint-dependencies:
	$(MINT) bootstrap --overwrite y

.PHONY: open
open:
	open ./$(workspace_name)

.PHONY: build-debug-develop
build-debug-develop:
	$(MAKE) build-debug PROJECT_NAME=Develop

.PHONY: build-debug
build-debug:
	set -o pipefail \
&& xcodebuild \
-sdk $(TEST_SDK) \
-configuration $(TEST_CONFIGURATION) \
-workspace $(workspace_name) \
-scheme '$(PROJECT_NAME)' \
-destination $(TEST_DESTINATION) \
-skipPackagePluginValidation \
clean build \
| tee $(product_name)_$(PROJECT_NAME)_Build.log

.PHONY: lint
lint:
	$(SWIFTLINT)

.PHONY: fix
fix:
	$(SWIFTLINT) --fix --format
```

### 7. SwiftLintを設定する

`Mintfile` にSwiftLintを書きます。

```
realm/SwiftLint@0.60.0
```

`.swiftlint.yml` は [Loki のもの](https://github.com/uhooi/Loki/blob/main/.swiftlint.yml) をコピーして使ってください。無効にしたルールには理由をコメントで書きます。

### 8. 最初の画面を作る

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

### 9. ビルドできることを確認する

```shell
$ make setup
$ make lint && make build-debug-develop
```

## チェックリスト

- [ ] ソースコードがSwiftパッケージに寄っている
- [ ] Xcodeプロジェクトには `@main` の構造体とリソースしかない
- [ ] Production・Develop・Catalogの3つのアプリがある
- [ ] 4層のディレクトリがある
- [ ] 全ターゲットに `swiftSettings` が当たっている
- [ ] LogCoreに全ターゲットが依存している
- [ ] `make lint` と `make build-debug-develop` が通る
