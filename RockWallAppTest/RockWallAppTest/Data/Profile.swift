//
//  Profile.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import Foundation
import SwiftUI

struct Profile {
    let name: String
    let chapmanID: Int
    let email: String
    let isSetter: Bool
    let username: String
    let password: String
    
    let imageName: String
    var image: Image {
        Image(imageName)
    }
}
