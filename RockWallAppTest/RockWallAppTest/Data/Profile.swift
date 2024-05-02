//
//  Profile.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import Foundation
import SwiftUI

struct Profile: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var chapmanID: Int
    var email: String
    var isSetter: Bool
    var username: String
    var password: String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
