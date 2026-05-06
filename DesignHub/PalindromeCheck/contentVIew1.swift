//
//  contentVIew1.swift
//  DesignHub
//
//  Created by Vikram Kumar on 05/05/26.
//

import SwiftUI

struct ContentView1: View {
    
    @State private var inputText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Enter text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            HighlightedPalindromeView(text: inputText)
            
            Spacer()
        }
        .padding()
    }
}

struct HighlightedPalindromeView: View {
    let text: String
    
    var body: some View {
        let range = longestPalindromeRange(text)
        let chars = Array(text)
        
        HStack(spacing: 0) {
            ForEach(0..<chars.count, id: \.self) { index in
                Text(String(chars[index]))
                    .foregroundColor(range.contains(index) ? .green : .red)
            }
        }
        .font(.title2)
        .padding()
    }
}

func longestPalindromeRange(_ text: String) -> Range<Int> {
    let chars = Array(text)
    let n = chars.count
    
    if n == 0 { return 0..<0 }
    
    var start = 0
    var end = 0
    
    for i in 0..<n {
        
        let len1 = expand(chars, i, i)       // odd
        let len2 = expand(chars, i, i + 1)   // even
        
        let maxLen = max(len1, len2)
        
        if maxLen > (end - start) {
            start = i - (maxLen - 1) / 2
            end = i + maxLen / 2
        }
    }
    
    return start..<(end + 1)
}

func expand(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
    var l = left
    var r = right
    
    while l >= 0 && r < chars.count && chars[l] == chars[r] {
        l -= 1
        r += 1
    }
    
    return r - l - 1
}
