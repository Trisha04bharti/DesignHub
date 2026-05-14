//
//  SumView.swift
//  DesignHub
//
//  Created by Vikram Kumar on 14/05/26.
//

import SwiftUI

struct SumView: View {
    
    @State private var input = ""
    @State private var answer = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Recursive Sum")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter Number", text: $input)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.horizontal)
            
            Button("Calculate Sum") {
                
                if let number = Int(input) {
                    answer = recursiveSum(number)
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text("Answer: \(answer)")
                .font(.title2)
                .bold()
        }
        .padding()
    }
    
    func recursiveSum(_ n: Int) -> Int {
        
        // Base Case
        if n == 0 {
            return 0
        }
        
        // Recursive Call
        return n + recursiveSum(n - 1)
    }
}

#Preview {
    SumView()
}
