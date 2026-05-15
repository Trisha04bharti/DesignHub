
import SwiftUI

struct ContentView7: View {

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        ScrollView {

            LazyVGrid(columns: columns, spacing: 20) {

                ForEach(1...10, id: \.self) { item in

                    Text("\(item)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView7()
}

