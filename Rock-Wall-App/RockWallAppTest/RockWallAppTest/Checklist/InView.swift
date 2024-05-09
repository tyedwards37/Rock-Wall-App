//
//  InView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import SwiftUI

struct InView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.todosOpening, id:\.name){ (todo) in
                    TodoRowOpening(todo: todo)
                }
            } .navigationBarTitle("Opening Checklist")
        }
    }
}


#Preview {
    InView()
        .environment(ModelData())
}

