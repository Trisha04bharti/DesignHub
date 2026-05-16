//
//  Power.swift
//  DesignHub
//
//  Created by Vikram Kumar on 16/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var baseText: String = ""
    @State private var powerText: String = ""
    @State private var result: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Recursive Power Calculator")
                .font(.title2)
                .bold()
            
            TextField("Enter Base", text: $baseText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Enter Power", text: $powerText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Button("Calculate") {
                if let base = Int(baseText),
                   let power = Int(powerText) {
                    
                    result = powerRecursive(base: base, power: power)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Result: \(result)")
                .font(.title3)
                .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
    
    // Recursive Function
    func powerRecursive(base: Int, power: Int) -> Int {
        if power == 0 {
            return 1
        }
        
        return base * powerRecursive(base: base, power: power - 1)
    }
}

#Preview {
    ContentView()
}
