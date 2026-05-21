//
//  fallingBallView.swift
//  DesignHub
//
//  Created by Vikram Kumar on 21/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var ballOffset: CGFloat = 0
    @State private var shadowScale: CGFloat = 1.0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .blue.opacity(0.6)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                ZStack {
                    // Shadow
                    Ellipse()
                        .fill(Color.black.opacity(0.3))
                        .frame(width: 100, height: 20)
                        .scaleEffect(shadowScale)
                        .offset(y: 80)

                    // Ball
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.red, .orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 80, height: 80)
                        .offset(y: ballOffset)
                        .shadow(color: .white.opacity(0.4), radius: 10)
                }

                Spacer()
            }
        }
        .onAppear {
            jumpAnimation()
        }
    }

    // Recursive animation function
    func jumpAnimation() {
        withAnimation(.easeOut(duration: 0.5)) {
            ballOffset = -220
            shadowScale = 0.5
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeIn(duration: 0.5)) {
                ballOffset = 0
                shadowScale = 1.0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // Recursive call
                jumpAnimation()
            }
        }
    }
}

#Preview {
    ContentView()
}
