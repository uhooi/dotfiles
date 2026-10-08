import Combine
import Foundation
import os
import LogCore

// MARK: - UI state

struct ___FILEBASENAMEASIDENTIFIER___UiState {
    // TODO: 画面の状態を書く
    var ___VARIABLE_screenName___Error: ___FILEBASENAMEASIDENTIFIER___Error?
}

// MARK: - Actions

enum ___FILEBASENAMEASIDENTIFIER___Action {
    case screen(_ action: ___FILEBASENAMEASIDENTIFIER___ScreenAction)
    case view(_ action: ___FILEBASENAMEASIDENTIFIER___ViewAction)
}

enum ___FILEBASENAMEASIDENTIFIER___AsyncAction {
    case screen(_ asyncAction: ___FILEBASENAMEASIDENTIFIER___ScreenAsyncAction)
    case view(_ asyncAction: ___FILEBASENAMEASIDENTIFIER___ViewAsyncAction)
}

// MARK: - Error

enum ___FILEBASENAMEASIDENTIFIER___Error: LocalizedError {
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
final class ___FILEBASENAMEASIDENTIFIER___ViewModel: ObservableObject {
    @Published private(set) var uiState: ___FILEBASENAMEASIDENTIFIER___UiState

    // TODO: 画面遷移のクロージャやリポジトリを持つ
    // private let repository: any XxxRepository

    init(
        // repository: some XxxRepository = DefaultXxxRepository.shared,
    ) {
        self.uiState = ___FILEBASENAMEASIDENTIFIER___UiState()
        // self.repository = repository
    }

    func send(_ action: ___FILEBASENAMEASIDENTIFIER___Action) {
        let message = "\(#function) action: \(action)"
        Logger.standard.debug("\(message, privacy: .public)")

        switch action {
        case let .screen(screenAction):
            switch screenAction {
            case .onErrorAlertDismiss:
                uiState.___VARIABLE_screenName___Error = nil
            }

        case let .view(viewAction):
            switch viewAction {
            }
        }
    }

    func sendAsync(_ asyncAction: ___FILEBASENAMEASIDENTIFIER___AsyncAction) async {
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

private extension ___FILEBASENAMEASIDENTIFIER___ViewModel {
    // TODO: ロジックが長くなったら、ここへメソッドで切り出す
    // 例:
    // func refresh() async {
    //     do {
    //         uiState.items = try await repository.items()
    //     } catch is CancellationError {
    //         // Do nothing when cancelled
    //     } catch {
    //         uiState.___VARIABLE_screenName___Error = .fetchFailed(localizedDescription: error.localizedDescription)
    //     }
    // }
}
