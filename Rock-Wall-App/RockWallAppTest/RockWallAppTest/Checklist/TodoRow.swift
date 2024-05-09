//
//  TodoRow.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/9/24.
//

import SwiftUI

struct TodoRow: View {
    @Environment(ModelData.self) var modelData
    var todo: Todo
    
    var todoIndexOpening: Int {
            modelData.todosOpening.firstIndex(where: { $0.id == todo.id })!
    }
    
    var todoIndexClosing: Int {
            modelData.todosClosing.firstIndex(where: { $0.id == todo.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        HStack{
            Image(systemName: todo.category)
                .resizable()
                .frame( width: 40, height: 40 )
            Text(todo.name)
            Spacer()
            
            DoneButton(isDone: $modelData.todosOpening[todoIndexOpening].isDone)
            
            if todo.isDone {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame( width: 25, height: 25 )
                    
            } else {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame( width: 25, height: 25 )
                }
            }
        }
    }


#Preview {
    let modelData = ModelData()
    return Group {
        TodoRow(todo: modelData.todosOpening[0])
    }
    .environment(modelData)
}
