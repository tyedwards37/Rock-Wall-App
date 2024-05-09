//
//  TodoRow.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/9/24.
//

import SwiftUI

struct TodoRowClosing: View {
    @Environment(ModelData.self) var modelData
    var todo: Todo
    
    var todoIndex: Int {
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
            
            Button(action: {
                modelData.todosClosing[todoIndex].isDone.toggle()
            }) {
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
    }


#Preview {
    let modelData = ModelData()
    return Group {
        TodoRowClosing(todo: modelData.todosClosing[0])
    }
    .environment(modelData)
}
