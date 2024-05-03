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
    var user: Profile
        
        var body: some View {
            NavigationView {
                GeometryReader { geometry in
                    VStack {
                        TabView(selection: $selection) {
                            CheckInOutView()
                                .tabItem {
                                    Image(systemName: "checklist")
                                    Text("Check In/Out")
                                }
                                .tag(1)

                            ManageClimbsView()
                                .tabItem {
                                    Image(systemName: "figure.climbing")
                                    Text("Manage Climbs")
                                }
                                .tag(2)

                            RopeLogView()
                                .tabItem {
                                    Image(systemName: "list.number")
                                    Text("Rope Log")
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
    HomeView(user: Profile(id: 1, name: "John Doe", chapmanID: 2399564, email: "john@chapman.edu", isSetter: false, username: "jDude", password: "iluvclimbing", imageName: "user"))
}
