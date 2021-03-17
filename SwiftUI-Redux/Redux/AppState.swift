//
//  AppState.swift
//  SwiftUI-Redux
//
//  Created by David S on 7/2/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
    var listState: RepositoryListState
    
    init(listState: RepositoryListState = .init()) {
        self.listState = listState
    }
}

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    state.listState = RepositoryListReducer.reduce(action: action, state: state.listState)
    return state
}
