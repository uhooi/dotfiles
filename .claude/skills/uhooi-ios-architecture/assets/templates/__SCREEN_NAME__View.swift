import SwiftUI

// MARK: - Actions

enum __SCREEN_NAME__ViewAction {
    // TODO: 子ビューで起きるイベントを書く
    // 例: case onSaveButtonClick
}

enum __SCREEN_NAME__ViewAsyncAction {
}

// MARK: - View

struct __SCREEN_NAME__View: View {
    // TODO: 表示に必要な値を let で受け取る
    let send: (__SCREEN_NAME__ViewAction) -> Void

    var body: some View {
        Form {
            // TODO: 見た目を書く
        }
    }
}

// MARK: - Privates

private extension __SCREEN_NAME__View {
    // TODO: bodyが長くなったら、ここへ計算プロパティで切り出す
    // 例:
    // var generalSection: some View {
    //     Section { ... }
    // }
}

#if DEBUG
// MARK: - Previews

#Preview {
    __SCREEN_NAME__View(
        send: { _ in },
    )
}
#endif
