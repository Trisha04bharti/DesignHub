//
//  product.swift
//  DesignHub
//
//  Created by Vikram Kumar on 16/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number1Text: String = ""
    @State private var number2Text: String = ""
    @State private var result: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Recursive Product Calculator")
                .font(.title2)
                .bold()
            
            TextField("Enter First Number", text: $number1Text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Enter Second Number", text: $number2Text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Button("Calculate Product") {
                if let num1 = Int(number1Text),
                   let num2 = Int(number2Text) {
                    
                    result = recursiveMultiply(a: num1, b: num2)
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Result: \(result)")
                .font(.title3)
                .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
    
    // Recursive Multiplication Function
    func recursiveMultiply(a: Int, b: Int) -> Int {
        if b == 0 {
            return 0
        }
        
        return a + recursiveMultiply(a: a, b: b - 1)
    }
}

#Preview {
    ContentView()
}
