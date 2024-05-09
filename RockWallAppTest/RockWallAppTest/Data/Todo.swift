//
//  Todo.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import Foundation
import SwiftUI

struct Todo: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var isDone: Bool
}
