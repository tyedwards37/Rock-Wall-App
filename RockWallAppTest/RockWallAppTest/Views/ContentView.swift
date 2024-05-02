//
//  ContentView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView(user: Profile(name: "John Doe", chapmanID: 2399564, email: "john@chapman.edu", isSetter: false, username: "jDude", password: "iluvclimbing", imageName: "user"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
  Ask Prof:
 - why is the profile button on a line of its own
 */
