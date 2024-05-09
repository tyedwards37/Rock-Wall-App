//
//  OutView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import SwiftUI

struct OutView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.todosClosing, id:\.name){ (todo) in
                    TodoRowClosing(todo: todo)
                }
            } .navigationBarTitle("Closing Checklist")
        }
    }
}


#Preview {
    OutView()
        .environment(ModelData())
}
