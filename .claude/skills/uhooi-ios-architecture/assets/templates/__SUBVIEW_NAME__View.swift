import SwiftUI

// MARK: - Action

enum __SUBVIEW_NAME__ViewAction {
    // TODO: この部品で起きるイベントを書く
    // 例: case onEditButtonClick
}

// MARK: - View

struct __SUBVIEW_NAME__View: View {
    // TODO: 表示に必要な値を let で受け取る
    let send: (__SUBVIEW_NAME__ViewAction) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // TODO: 見た目を書く
        }
    }
}

// MARK: - Privates

private extension __SUBVIEW_NAME__View {
    // TODO: bodyが長くなったら、ここへ計算プロパティで切り出す
}

#if DEBUG
// MARK: - Previews

#Preview {
    __SUBVIEW_NAME__View(
        send: { _ in },
    )
}
#endif
