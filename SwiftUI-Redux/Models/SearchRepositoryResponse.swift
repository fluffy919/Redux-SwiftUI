//
//  SearchRepositoryResponse.swift
//  SwiftUI-Flux
//
//  Created by David S on 6/5/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation

struct SearchRepositoryResponse: Decodable {
    var items: [Repository]
}
