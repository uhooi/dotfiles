import SwiftUI
import os
import LogCore
import UICore

// MARK: Actions

enum __SCREEN_NAME__ScreenAction {
    case onErrorAlertDismiss
}

enum __SCREEN_NAME__ScreenAsyncAction {
    case task
}

// MARK: - View

struct __SCREEN_NAME__Screen: View {
    @StateObject private var viewModel: __SCREEN_NAME__ViewModel

    var body: some View {
        __SCREEN_NAME__View(
            // TODO: uiStateから表示に必要な値だけ渡す
            send: { action in
                viewModel.send(.view(action))
            },
        )
        .navigationTitle(String(localized: "__SCREEN_NAME__", bundle: .module))
        .errorAlert(
            error: viewModel.uiState.__screenName__Error,
            onDismiss: { viewModel.send(.screen(.onErrorAlertDismiss)) },
        )
        .task {
            await viewModel.sendAsync(.screen(.task))
        }
    }

    init() {
        Logger.standard.debug("\(#function, privacy: .public)")

        self._viewModel = StateObject(wrappedValue: __SCREEN_NAME__ViewModel())
    }
}

// MARK: - Privates

private extension __SCREEN_NAME__Screen {
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
        __SCREEN_NAME__Screen()
    }
}
#endif
