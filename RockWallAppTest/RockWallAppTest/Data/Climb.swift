//
//  Climb.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import Foundation
import SwiftUI

struct Climb: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
    private var colorName: String
    var color: Color {
        switch colorName {
        case "Red", "red":
            return Color.red
        case "Blue", "blue":
            return Color.blue
        case "Orange", "orange":
            return Color.orange
        case "Pink", "pink":
            return Color.pink
        case "Purple", "purple":
            return Color.purple
        case "Yellow", "yellow":
            return Color.yellow
        case "Black", "black":
            return Color.black
            
        default:
            return Color.gray
        }
    }
    
    var difficulty: String
    var setter: String
    var isSet: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
