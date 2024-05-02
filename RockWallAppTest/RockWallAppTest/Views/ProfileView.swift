//
//  ProfileView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct ProfileView: View {
    var user: Profile
    
    var body: some View {
        VStack(alignment: .center) {
            user.image
                .scaleEffect(0.32)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .padding(.bottom, 20)
            Text("\(user.name)")
                .font(.title)
            Text("\(user.email)")
                .font(.subheadline)
            Text("Student ID: " + String(user.chapmanID).replacingOccurrences(of: ",", with: ""))
                .font(.subheadline)
            Divider()
            HStack {
                Text("Username: \(user.username)")
                    .foregroundStyle(.secondary)
                Spacer()
                user.isSetter ? Text("Setter") :
                Text("Rock Wall Assistant")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView(user: Profile(name: "John Doe", chapmanID: 2399564, email: "john@chapman.edu", isSetter: false, username: "jDude", password: "iluvclimbing", imageName: "user"))
}
