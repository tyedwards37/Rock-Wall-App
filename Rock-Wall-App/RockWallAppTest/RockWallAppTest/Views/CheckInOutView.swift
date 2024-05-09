//
//  CheckInOutView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct CheckInOutView: View {
    @State private var rwa1 = ""
    @State private var rwa2 = ""
    @State private var rwa3 = ""
    @State private var rwa4 = ""
    @State private var date = Date()
    @State private var checkInActive = false
    @State private var checkOutActive = false
    
    var body: some View {
        VStack {
            Text("Daily Check In/Out Sheets")
                .font(.title)
                .bold()
            
            TextField("RWA 1", text: $rwa1)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5.0)
            .padding(.horizontal)
            
            TextField("RWA 2", text: $rwa2)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5.0)
            .padding(.horizontal)

            TextField("RWA 3", text: $rwa3)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5.0)
            .padding(.horizontal)

            TextField("RWA 4", text: $rwa4)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5.0)
            .padding(.horizontal)
            
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
