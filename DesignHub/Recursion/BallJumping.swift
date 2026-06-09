//
//  BallJumping.swift
//  DesignHub
//
//  Created by Vikram Kumar on 10/06/26.
//

import SwiftUI

struct BallJumpView: View {
    
    @State private var jump = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Circle()
                .fill(.blue)
                .frame(width: 80, height: 80)
                .offset(y: jump ? -250 : 0)
                .animation(
                    .interpolatingSpring(
                        stiffness: 120,
                        damping: 5
                    )
                    .repeatForever(autoreverses: true),
                    value: jump
                )
            
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(width: 200, height: 5)
        }
        .padding()
        .onAppear {
            jump = true
        }
    }
}

#Preview {
    BallJumpView()
}
