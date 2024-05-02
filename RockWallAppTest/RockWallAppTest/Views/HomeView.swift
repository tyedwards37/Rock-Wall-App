//
//  HomeView.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 5/2/24.
//

import SwiftUI

struct HomeView: View {
        @State private var isShowingProfilePopup = false
        @State private var selection = 2
        let user = Profile(name: "John Doe", chapmanID: 2399564, email: "john@chapman.edu", isSetter: false, username: "jDude", password: "iluvclimbing", imageName: "user")
        
        var body: some View {
            NavigationView {
                GeometryReader { geometry in
                    VStack {
                        TabView(selection: $selection) {
                            CheckInOutView()
                                .tabItem {
                                    Text("Check In/Out")
                                        .font(.largeTitle)
                                }
                                .tag(1)

                            ManageClimbsView()
                                .tabItem {
                                    Text("Manage Climbs")
                                        .font(.largeTitle)
                                }
                                .tag(2)

                            RopeLogView()
                                .tabItem {
                                    Text("Rope Log")
                                        .font(.largeTitle)
                                }
                                .tag(3)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isShowingProfilePopup.toggle()
                            } label: {
                                Label("User Profile", systemImage: "person.crop.circle")
                            }
                        }
                    }
                }
                .sheet(isPresented: $isShowingProfilePopup) {
                    ProfileView(user: user)
                }
            }
        }
}


#Preview {
    HomeView()
}
