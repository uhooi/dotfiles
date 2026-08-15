import Combine
import Foundation
import os
import LogCore

// MARK: UI state

struct __SCREEN_NAME__UiState {
    // TODO: 画面の状態を書く
    var __screenName__Error: __SCREEN_NAME__Error?
}

// MARK: - Actions

enum __SCREEN_NAME__Action {
    case screen(_ action: __SCREEN_NAME__ScreenAction)
    case view(_ action: __SCREEN_NAME__ViewAction)
}

enum __SCREEN_NAME__AsyncAction {
    case screen(_ asyncAction: __SCREEN_NAME__ScreenAsyncAction)
    case view(_ asyncAction: __SCREEN_NAME__ViewAsyncAction)
}

// MARK: - Error

enum __SCREEN_NAME__Error: LocalizedError {
    // TODO: この画面で起きるエラーを書く
    case fetchFailed(localizedDescription: String)

    var errorDescription: String? {
        switch self {
        case let .fetchFailed(localizedDescription): localizedDescription
        }
    }
}

// MARK: - View model

@MainActor
final class __SCREEN_NAME__ViewModel: ObservableObject {
    @Published private(set) var uiState: __SCREEN_NAME__UiState

    // TODO: 画面遷移のクロージャやリポジトリを持つ
    // private let repository: any XxxRepository

    init(
        // repository: some XxxRepository = DefaultXxxRepository.shared,
    ) {
        self.uiState = __SCREEN_NAME__UiState()
        // self.repository = repository
    }

    func send(_ action: __SCREEN_NAME__Action) {
        let message = "\(#function) action: \(action)"
        Logger.standard.debug("\(message, privacy: .public)")

        switch action {
        case let .screen(screenAction):
            switch screenAction {
            case .onErrorAlertDismiss:
                uiState.__screenName__Error = nil
            }

        case let .view(viewAction):
            switch viewAction {
            }
        }
    }

    func sendAsync(_ asyncAction: __SCREEN_NAME__AsyncAction) async {
        let message = "\(#function) asyncAction: \(asyncAction)"
        Logger.standard.debug("\(message, privacy: .public)")

        switch asyncAction {
        case let .screen(screenAsyncAction):
            switch screenAsyncAction {
            case .task:
                // TODO: 初期表示の処理を書く
                break
            }

        case let .view(viewAsyncAction):
            switch viewAsyncAction {
            }
        }
    }
}

// MARK: - Privates

private extension __SCREEN_NAME__ViewModel {
    // TODO: ロジックが長くなったら、ここへメソッドで切り出す
    // 例:
    // func refresh() async {
    //     do {
    //         uiState.items = try await repository.items()
    //     } catch is CancellationError {
    //         // Do nothing when cancelled
    //     } catch {
    //         uiState.__screenName__Error = .fetchFailed(localizedDescription: error.localizedDescription)
    //     }
    // }
}
