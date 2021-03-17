//
//  Middleware.swift
//  SwiftUI-Redux
//
//  Created by David S on 7/5/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation
import ReSwift

typealias DispatchFunctionClosure = (@escaping DispatchFunction) -> DispatchFunction
typealias MiddlewareFunction = (@escaping DispatchFunction, @escaping () -> AppState?) -> DispatchFunctionClosure

let thunkMiddleware: Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            if let action = action as? ThunkAction {
                _ = action.future
                    .receive(on: DispatchQueue.main)
                    .sink(receiveValue: {
                        next($0)
                    })
            } else {
                return next(action)
            }
        }
    }
}
