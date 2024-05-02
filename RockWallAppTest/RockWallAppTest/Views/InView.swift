//
//  InView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import SwiftUI

struct InView: View {
    @State private var todos = [
        Todo(id: 1, name:"Write SwiftUI book",category: "square.and.arrow.up", isDone: false),
        Todo(id: 2, name:"Read Bible",category: "square.and.arrow.up", isDone: false),
        Todo(id: 3, name:"Bring kids out to play",category: "square.and.arrow.up", isDone: false),
        Todo(id: 4, name:"Fetch wife",category: "square.and.arrow.up", isDone: false),
        Todo(id: 5, name:"Call mum",category: "square.and.arrow.up", isDone: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos, id:\.name){ (todo) in
                    HStack{
                        Image(systemName: todo.category)
                            .resizable()
                            .frame( width: 30, height: 40 )
                        Text(todo.name)
                        Spacer()
                        
                        Button(action: {
                            if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                                todos[index].isDone.toggle()
                            }
                        })  {
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
            } .navigationBarTitle("Check-In")
        }
    }
}


#Preview {
    InView()
}

