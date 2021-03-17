//
//  User.swift
//  SwiftUI-Flux
//
//  Created by David S on 6/5/19.
//  Copyright © 2019 David S. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Decodable, Hashable, Identifiable {
    var id: Int64
    var login: String
    var avatarUrl: URL
}
