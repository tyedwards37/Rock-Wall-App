//
//  CheckInOutView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct CheckInOutView: View {
    @State private var rwas = ["RWA 1", "RWA 2", "RWA 3", "RWA 4"] // can be changed later based on # of staff working at the wall
    @State private var rwaValues = ["", "", "", ""]
    @State private var date = Date()
    @State private var checkInActive = false
    @State private var checkOutActive = false
    
    var body: some View {
        VStack {
            Text("Daily Check In/Out Sheets")
                .font(.title)
                .bold()
            
            // go through staff and place a textbox for them
            ForEach(0..<rwas.count, id: \.self) { index in
                TextField(rwas[index], text: $rwaValues[index])
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.horizontal)
            }
            
            DatePicker(selection: .constant(date), label: { Text("Day:") })
                .padding(.horizontal)
            
            HStack {
                Button(action: {checkInActive.toggle() })
                {
                    Text("Opening")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .padding()
                .background(
                    NavigationLink(destination: InView(), isActive: $checkInActive) {EmptyView()}
                )
                
                //TODO: Need to allow app to save data in database of tasks that were successfully completed/not completed
                Button(action: {checkOutActive.toggle() })
                {
                    Text("Closing")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .padding()
                .background(
                    NavigationLink(destination: OutView(), isActive: $checkOutActive) {EmptyView()}
                )
            }
            .padding()

        }
    }
}


#Preview {
    CheckInOutView()
}
