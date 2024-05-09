//
//  OutView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import SwiftUI

struct OutView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(todosClosing, id:\.name){ (todo) in
                    HStack{
                        Image(systemName: todo.category)
                            .resizable()
                            .frame( width: 40, height: 40 )
                        Text(todo.name)
                        Spacer()
                        
                        Button(action: {
                            if let index = todosClosing.firstIndex(where: { $0.id == todo.id }) {
                                todosClosing[index].isDone.toggle()
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
            } .navigationBarTitle("Closing Checklist")
        }
    }
}


#Preview {
    OutView()
}
