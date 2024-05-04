//
//  RopeLogView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct RopeLogView: View {
    @State private var climbs1 = 0
    @State private var climbs2 = 0
    @State private var climbs3 = 0
    @State private var climbs4 = 0
    @State private var climbs5 = 0
    @State private var climbs6 = 0
    @State private var date = Date()
    @State private var isConfirming = false
    @State private var submitted = false
    
    var body: some View {
        VStack {
            Text("Rope Log")
                .font(.largeTitle)
                .bold()
            
            HStack {
                Image(systemName: "figure.climbing")
                    .resizable()
                    .frame(width:40, height:50)
                Image(systemName: "list.number")
                    .resizable()
                    .frame(width:40, height:40)
            } .padding(.bottom, 30)
            
            DatePicker(selection: .constant(date), label: { Text("Day:") })
                .padding(.horizontal)
            
            HStack {
                Text("1 - " + climbs[0].name + ":")
                    .padding(.horizontal)
                Stepper(value: $climbs1, in: 0...40) {
                        Text("\(climbs1)")
                    }
                .padding(.horizontal)
            }
            
            HStack {
                Text("2 - " + climbs[1].name + ":")
                    .padding(.horizontal)
                Stepper(value: $climbs2, in: 0...40) {
                        Text("\(climbs2)")
                    }
                .padding(.horizontal)
            }
            
            HStack {
                Text("3 - " + climbs[2].name + ":")
                    .padding(.horizontal)
                Stepper(value: $climbs3, in: 0...40) {
                        Text("\(climbs3)")
                    }
                .padding(.horizontal)
            }
            
            HStack {
                Text("4 - " + climbs[3].name + ":")
                    .padding(.horizontal)
                Stepper(value: $climbs4, in: 0...40) {
                        Text("\(climbs4)")
                    }
                .padding(.horizontal)
            }
            
            HStack {
                Text("5 - " + climbs[4].name + ":")
                    .padding(.horizontal)
                Stepper(value: $climbs5, in: 0...40) {
                        Text("\(climbs5)")
                    }
                .padding(.horizontal)
            }
            
            HStack {
                Text("6 - " + climbs[5].name + ":")
                    .padding(.horizontal)
                Stepper(value: $climbs6, in: 0...40) {
                        Text("\(climbs6)")
                    }
                .padding(.horizontal)
            }
            
            Button(action: { isConfirming = true })
            {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
            .padding()
            .alert(isPresented: $isConfirming) {
                Alert(title: Text("Confirm Submission"), message: Text("Are you sure you want to submit?"), primaryButton: .default(Text("Submit")) {
                    submitted.toggle()
                }, secondaryButton: .cancel())
            }
            .alert(isPresented: $submitted) {
                Alert(title: Text("Rope Log Submitted"), message: Text("\(date)"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    RopeLogView()
}
