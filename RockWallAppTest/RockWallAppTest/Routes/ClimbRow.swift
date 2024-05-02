//
//  ClimbRow.swift
//  RockWallAppTest
//
//  Created by Tyler Edwards on 4/30/24.
//

import SwiftUI

struct ClimbRow: View {
    var climb: Climb

    var body: some View {
        HStack {
            Circle()
                .fill(climb.color)
                .frame(width: 20, height: 20)
            Text(String(climb.id) + " - " + climb.name)
            Spacer()
        }
    }
}


#Preview {
    Group {
        ClimbRow(climb: climbs[0])
        ClimbRow(climb: climbs[1])
    }
}
