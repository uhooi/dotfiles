import SwiftUI

// MARK: - Actions

enum ___FILEBASENAMEASIDENTIFIER___ViewAction {
    // TODO: 子ビューで起きるイベントを書く
    // 例: case onSaveButtonClick
}

enum ___FILEBASENAMEASIDENTIFIER___ViewAsyncAction {
}

// MARK: - View

struct ___FILEBASENAMEASIDENTIFIER___View: View {
    // TODO: 表示に必要な値を let で受け取る
    let send: (___FILEBASENAMEASIDENTIFIER___ViewAction) -> Void

    var body: some View {
        Form {
            // TODO: 見た目を書く
        }
    }
}

// MARK: - Privates

private extension ___FILEBASENAMEASIDENTIFIER___View {
    // TODO: bodyが長くなったら、ここへ計算プロパティで切り出す
    // 例:
    // var generalSection: some View {
    //     Section { ... }
    // }
}

#if DEBUG
// MARK: - Previews

#Preview {
    ___FILEBASENAMEASIDENTIFIER___View(
        send: { _ in },
    )
}
#endif
