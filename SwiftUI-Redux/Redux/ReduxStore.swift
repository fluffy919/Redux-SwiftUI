//
//  ReduxStore.swift
//  SwiftUI-Redux
//
//  Created by David S on 7/5/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation
import ReSwift

final class ReduxStore: ReactiveStore, ActionCreatorables {
    
    override init(store: Store<AppState>) {
        super.init(store: store)
    }
    
    private func create( _ actionCreatorProvider: @escaping RequestActionCreator) -> Action? {
        return actionCreatorProvider(state, self)
    }
    
    func dispatch(_ actionCreatorProvider: @escaping RequestActionCreator) {
        guard let action = create(actionCreatorProvider) else { return }
        dispatch(action)
    }
}
