//
//  ClimbList.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct ClimbList: View {
    var body: some View {
        VStack {
            NavigationSplitView {
                List(climbs) { climb in
                    NavigationLink {
                        ClimbDetail(climb: climb, image: climb.image)
                    } label: {
                        ClimbRow(climb: climb)
                    }
                }
                .navigationTitle("Routes")
            } detail: {
                Text("Currently Set Climbs:")
        }
        }
    }
}

#Preview {
    ClimbList()
}
