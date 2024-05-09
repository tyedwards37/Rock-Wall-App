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
        LoginView(users: profiles)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(ModelData())
    }
}
