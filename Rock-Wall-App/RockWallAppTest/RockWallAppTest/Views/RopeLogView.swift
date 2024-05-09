import SwiftUI

enum AlertType: Identifiable {
    case confirmation
    case submissionSuccess
    
    var id: Int {
        hashValue
    }
}

struct RopeLogView: View {
    @State var climbs: [Climb] = []
    @State private var date = Date()
    @State private var alertType: AlertType?
    
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
            
            DatePicker(selection: $date, label: { Text("Day:") })
                .padding(.horizontal)
            
            // Display climbs
            HStack {
                VStack(alignment: .leading) {
                    ForEach(climbs.indices, id: \.self) { index in
                        Text(climbs[index].name)
                            .frame(maxWidth: 80, alignment: .leading)
                            .padding(13)
                            .bold()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                .padding(.top, 10)

                VStack(alignment: .trailing) {
                    ForEach(climbs.indices, id: \.self) { index in
                        Stepper(value: $climbs[index].climbCount, in: 0...40) {
                            Text("\(climbs[index].climbCount)")
                        }
                        .padding(14)
                    }
                } // end of VStack
            } // end of HStack
            
            // Submit button
            Button(action: {
                self.alertType = .confirmation
                print("DEBUG: Submit tapped")
            }) {
                Text("Submit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
        .alert(item: $alertType) { alertType in
            switch alertType {
            case .confirmation:
                return Alert(
                    title: Text("Confirmation"),
                    message: Text("Are you sure you want to submit?"),
                    primaryButton: .default(Text("Submit")) {
                        self.alertType = .submissionSuccess
                        print("Submit action confirmed")
                    },
                    secondaryButton: .cancel()
                )
            case .submissionSuccess:
                return Alert(
                    title: Text("Submission Successful"),
                    message: Text("Your submission was successful"),
                    dismissButton: .default(Text("OK")) {
                        // Additional actions after successful submission
                    }
                )
            }
        }
        .onAppear {
            // Load JSON data
            if let url = Bundle.main.url(forResource: "climbsData", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let allClimbs = try decoder.decode([Climb].self, from: data)
                    
                    // Filter climbs based on their IDs
                    let climbIDsToShow: [Int] = [1, 2, 3, 4, 5] // Example IDs to show
                    climbs = allClimbs.filter { climbIDsToShow.contains($0.id) }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
    }
}

// Preview
struct RopeLogView_Previews: PreviewProvider {
    static var previews: some View {
        RopeLogView()
    }
}
