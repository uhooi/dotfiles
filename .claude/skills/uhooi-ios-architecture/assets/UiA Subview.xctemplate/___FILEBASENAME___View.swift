import SwiftUI

// MARK: - Action

enum ___FILEBASENAMEASIDENTIFIER___ViewAction {
    // TODO: この部品で起きるイベントを書く
    // 例: case onEditButtonClick
}

// MARK: - View

struct ___FILEBASENAMEASIDENTIFIER___View: View {
    // TODO: 表示に必要な値を let で受け取る
    let send: (___FILEBASENAMEASIDENTIFIER___ViewAction) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // TODO: 見た目を書く
        }
    }
}

// MARK: - Privates

private extension ___FILEBASENAMEASIDENTIFIER___View {
    // TODO: bodyが長くなったら、ここへ計算プロパティで切り出す
}

#if DEBUG
// MARK: - Previews

#Preview {
    ___FILEBASENAMEASIDENTIFIER___View(
        send: { _ in },
    )
}
#endif
