//
//  TableCreation.swift
//  DesignHub
//
//  Created by Vikram Kumar on 15/05/26.
//

import SwiftUI

struct ContentView8: View {

    let rows = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]

    let items = Array(1...20)

    var body: some View {

        ScrollView(.horizontal) {

            LazyHGrid(rows: rows, spacing: 20) {

                ForEach(items, id: \.self) { item in

                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue)
                        .frame(width: 120, height: 100)
                        .overlay(

                            Text("Item \(item)")
                                .foregroundColor(.white)
                                .font(.headline)
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView8()
}
