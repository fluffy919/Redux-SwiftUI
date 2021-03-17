//
//  RepositoryListAction.swift
//  SwiftUI-Redux
//
//  Created by David S on 7/2/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation
import ReSwift
import Combine

enum RepositoryListAction: Action {
    case updateRepositories([Repository])
    case showError(APIServiceError)
    case showIcon
    
    static func requestAsyncCreator() -> RequestActionCreator {
        return { (_, store: DispatchingStoreType) in
            return ThunkAction(
                Future<Action, Never> { promise in
                    _ = APIService().response(from: SearchRepositoryRequest())
                        .catch { error -> Empty<SearchRepositoryResponse, Never> in
                            store.dispatch(RepositoryListAction.showError(error))
                            return .init()
                        }
                        .map { RepositoryListAction.updateRepositories($0.items) }
                        .sink(receiveValue: { action in
                            promise(.success(action))
                        })
                }
            )
        }
    }
}
