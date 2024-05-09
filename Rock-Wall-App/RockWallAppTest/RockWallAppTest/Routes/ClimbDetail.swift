//
//  ClimbDetail.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct ClimbDetail: View {
    var climb: Climb
    var image: Image
    
    var body: some View {
        ScrollView {
            climb.image
                .resizable()
                /*.overlay(
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(.black, lineWidth: 1)
                                )*/
                .scaleEffect(5.0)
                .frame(width: 100, height: 90)
                .padding(.bottom, 130)
            VStack {
                Circle()
                .overlay {
                        Circle().stroke(.black, lineWidth: 4)
                    }
                .shadow(radius: 7)
                .frame(width: 200, height: 200)
                .offset(y: -60)
                .padding(.bottom, -40)
                .foregroundColor(climb.color)
                


            VStack(alignment: .leading) {
                Text(climb.name)
                    .font(.title)
                Spacer()
                HStack {
                    Text("Setter: " + climb.setter)
                        Spacer()
                        Text(climb.difficulty)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                climb.isSet ? Text("Route is currently set.").font(.title2) :
                Text("Route is not set right now.").font(.title2)
                }
                .padding()

                Spacer()
            }
        }
    }
}

#Preview {
    ClimbDetail(climb: climbs[1], image: Image("empty"))
}
