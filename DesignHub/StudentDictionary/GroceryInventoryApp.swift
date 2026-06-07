//
//  GroceryInventoryApp.swift
//  DesignHub
//
//  Created by Vikram Kumar on 07/06/26.
//

import SwiftUI

struct ContentView: View {

    @State private var inventory: [String: Int] = [
        "Milk": 2,
        "Bread": 5,
        "Eggs": 12
    ]

    @State private var productName = ""
    @State private var quantity = ""

    var totalItems: Int {
        inventory.values.reduce(0, +)
    }

    var body: some View {

        NavigationView {
            VStack(spacing: 15) {

                Text("Total Items: \(totalItems)")
                    .font(.title3)
                    .fontWeight(.bold)

                TextField("Product Name", text: $productName)
                    .textFieldStyle(.roundedBorder)

                TextField("Quantity", text: $quantity)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)

                Button("Add Product") {

                    guard let qty = Int(quantity),
                          !productName.isEmpty else {
                        return
                    }

                    inventory[productName] = qty

                    productName = ""
                    quantity = ""
                }
                .buttonStyle(.borderedProminent)

                List {
                    ForEach(inventory.keys.sorted(), id: \.self) { item in

                        HStack {

                            VStack(alignment: .leading) {

                                Text(item)

                                if inventory[item] ?? 0 < 3 {
                                    Text("Low Stock")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                }
                            }

                            Spacer()

                            Button("-") {
                                decreaseQuantity(for: item)
                            }

                            Text("\(inventory[item] ?? 0)")
                                .frame(width: 40)

                            Button("+") {
                                increaseQuantity(for: item)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
            }
            .padding()
            .navigationTitle("Inventory")
        }
    }

    func increaseQuantity(for item: String) {
        inventory[item, default: 0] += 1
    }

    func decreaseQuantity(for item: String) {

        guard let currentQty = inventory[item] else { return }

        if currentQty > 1 {
            inventory[item] = currentQty - 1
        } else {
            inventory.removeValue(forKey: item)
        }
    }

    func deleteItem(at offsets: IndexSet) {

        let keys = inventory.keys.sorted()

        for index in offsets {
            inventory.removeValue(forKey: keys[index])
        }
    }
}

#Preview {
    ContentView()
}
