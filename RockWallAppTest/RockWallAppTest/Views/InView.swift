//
//  InView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import SwiftUI

struct InView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(todosOpening, id:\.name){ (todo) in
                    HStack{
                        Image(systemName: todo.category)
                            .resizable()
                            .frame( width: 40, height: 40 )
                        Text(todo.name)
                        Spacer()
                        
                        Button(action: {
                            if let index = todosOpening.firstIndex(where: { $0.id == todo.id }) {
                                todosOpening[index].isDone.toggle()
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
            } .navigationBarTitle("Opening Checklist")
        }
    }
}


#Preview {
    InView()
}

