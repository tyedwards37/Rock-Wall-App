//
//  LoginView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    
    var users: [Profile]

    // Prompt user for login information
    var body: some View {
        NavigationView {
            VStack {
                Text("Doti-Struppa Rock Wall")
                    .font(.largeTitle)
                    .padding(.top, 90)
                
                Text("Employee Login")
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 20)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)

                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.horizontal)

                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.horizontal)

                Button(action: { // successful login
                    var found = false
                    for user in users {
                        if username == user.username && password == user.password {
                            alertMessage = "Login Successful"
                            isLoggedIn = true
                            found = true
                            break
                        }
                    }
                    if !found { // unsuccessful login
                        alertMessage = "Login Failed"
                        isShowingAlert = true
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .alert(isPresented: $isShowingAlert) {
                    Alert(title: Text("Login Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                Spacer()
            }
            .padding()
            .navigationBarHidden(isLoggedIn)
            .background(
                Color.clear
            )
            .fullScreenCover(isPresented: $isLoggedIn) {
                HomeView(user: users.first(where: { $0.username == username })!)
            } // error with switching views, instead place view in background
        } // and allow HomeView to come up to front
    }
}


#Preview {
    LoginView(users: [
            Profile(id: 1, name: "John Doe", chapmanID: 2399564, email: "john@chapman.edu", isSetter: false, username: "jDude", password: "iluvclimbing", imageName: "user"),
        ])
}
