import SwiftUI
import UICore

// MARK: - Actions

enum ___FILEBASENAMEASIDENTIFIER___ScreenAction {
    case onErrorAlertDismiss
}

enum ___FILEBASENAMEASIDENTIFIER___ScreenAsyncAction {
    case task
}

// MARK: - View

struct ___FILEBASENAMEASIDENTIFIER___Screen: View {
    @StateObject private var viewModel: ___FILEBASENAMEASIDENTIFIER___ViewModel

    var body: some View {
        ___FILEBASENAMEASIDENTIFIER___View(
            // TODO: uiStateから表示に必要な値だけ渡す
            send: { action in
                viewModel.send(.view(action))
            },
        )
        .navigationTitle(String(localized: "___FILEBASENAMEASIDENTIFIER___", bundle: .module))
        .errorAlert(
            error: viewModel.uiState.___VARIABLE_screenName___Error,
            onDismiss: { viewModel.send(.screen(.onErrorAlertDismiss)) },
        )
        .task {
            await viewModel.sendAsync(.screen(.task))
        }
    }

    init() {
        self._viewModel = StateObject(wrappedValue: ___FILEBASENAMEASIDENTIFIER___ViewModel())
    }
}

// MARK: - Privates

private extension ___FILEBASENAMEASIDENTIFIER___Screen {
    // TODO: ツールバーが必要なら書く。不要ならこのextensionごと消す
    @ToolbarContentBuilder
    func toolbarContent(
        onCloseButtonClick: @escaping () -> Void,
    ) -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(role: .cancel, action: onCloseButtonClick) {
                Image(systemName: "xmark")
            }
            .accessibilityLabel(String(localized: "Close", bundle: .module))
        }
    }
}

#if DEBUG
// MARK: - Previews

#Preview {
    NavigationStack {
        ___FILEBASENAMEASIDENTIFIER___Screen()
    }
}
#endif
