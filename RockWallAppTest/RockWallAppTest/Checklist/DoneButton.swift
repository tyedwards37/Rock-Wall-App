//
//  DoneButton.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/9/24.
//

import SwiftUI

struct DoneButton: View {
    @Binding var isDone: Bool
    
    var body: some View {
        Button(action: {
            isDone.toggle()
        }) {
            Text("")
        }
    }
}

#Preview {
    DoneButton(isDone: .constant(true))
}
