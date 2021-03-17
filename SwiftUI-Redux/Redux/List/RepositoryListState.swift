//
//  RepositoryListState.swift
//  SwiftUI-Redux
//
//  Created by David S on 7/2/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation
import ReSwift
import Combine
import SwiftUI

// MARK: State
final class RepositoryListState: StateType, ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isErrorShown: Bool = false
    @Published var errorMessage: String = ""
    @Published var shouldShowIcon: Bool = false
}
