//
//  ProfileView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct ProfileView: View {
    var user: Profile
    @State private var isLoginViewPresented = false
    
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

            // Logout button
            VStack {
                Button(action: {
                    isLoginViewPresented = true
                }) {
                    Text("Log out")
                        .foregroundColor(.white)
                        .font(.title)
                } // As with login, user .fullScreenCover instead of changing views since the profile isn't really a "view", rather just a tab
                .padding(10)
                .background(Color.red)
                .cornerRadius(10)
                .fullScreenCover(isPresented: $isLoginViewPresented) {
                    LoginView(users: profiles)
                }
            }
            .padding(20)

        }
        .padding()
    }
}

#Preview {
    ProfileView(user: Profile(id: 1, name: "John Doe", chapmanID: 2399564, email: "john@chapman.edu", isSetter: false, username: "jDude", password: "iluvclimbing", imageName: "user"))
}
