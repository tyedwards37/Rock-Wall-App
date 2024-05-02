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
    
    var user: Profile

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

                Button(action: {
                    if username == user.username && password == user.password {
                        alertMessage = "Login Successful"
                        isLoggedIn = true
                    } else {
                        alertMessage = "Login Failed"
                    }
                    isShowingAlert = true
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
                NavigationLink(
                destination: HomeView(),
                isActive: $isLoggedIn,
                label: { EmptyView() }
                )
            )
        }
    }
}

#Preview {
    LoginView(user: Profile(id: 1, name: "John Doe", chapmanID: 2399564, email: "john@chapman.edu", isSetter: false, username: "jDude", password: "iluvclimbing", imageName: "user"))
}
