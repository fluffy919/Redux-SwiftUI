//
//  SearchRepositoryRequest.swift
//  SwiftUI-Flux
//
//  Created by David S on 6/9/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation

struct SearchRepositoryRequest: APIRequestType {
    typealias Response = SearchRepositoryResponse
    
    var path: String { return "/search/repositories" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: "SwiftUI"),
            .init(name: "order", value: "desc")
        ]
    }
}
