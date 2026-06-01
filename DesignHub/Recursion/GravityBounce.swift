//
//  GravityBounce.swift
//  DesignHub
//
//  Created by Vikram Kumar on 21/05/26.
//

import SwiftUI

struct ContentView: View {

    // Ball position
    @State private var ballY: CGFloat = -250

    // Physics values
    @State private var velocity: CGFloat = 0
    @State private var gravity: CGFloat = 1.2
    @State private var bounceFactor: CGFloat = 0.78

    // Drag
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging = false

    // Timer
    let timer = Timer.publish(every: 0.016, on: .main, in: .common).autoconnect()

    // Floor position
    let floorY: CGFloat = 300

    var body: some View {

        ZStack {

            // Background
            LinearGradient(
                colors: [.black, .blue.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                ZStack {

                    // Floor Shadow
                    Ellipse()
                        .fill(Color.black.opacity(0.3))
                        .frame(width: 120, height: 25)
                        .scaleEffect(shadowScale())
                        .offset(y: floorY + 45)

                    // Ball
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [.white, .red, .orange],
                                center: .topLeading,
                                startRadius: 5,
                                endRadius: 80
                            )
                        )
                        .frame(width: 90, height: 90)
                        .offset(
                            x: dragOffset.width,
                            y: ballY + dragOffset.height
                        )
                        .shadow(color: .white.opacity(0.4), radius: 12)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    isDragging = true
                                    dragOffset = value.translation
                                }
                                .onEnded { value in
                                    isDragging = false

                                    // Give upward throw effect
                                    velocity = value.predictedEndTranslation.height * 0.05

                                    dragOffset = .zero
                                }
                        )
                }

                Spacer()
            }
        }
        .onReceive(timer) { _ in
            updatePhysics()
        }
    }

    // MARK: - Physics Engine

    func updatePhysics() {

        guard !isDragging else { return }

        // Apply gravity
        velocity += gravity

        // Move ball
        ballY += velocity

        // Collision with floor
        if ballY > floorY {

            // Clamp to floor
            ballY = floorY

            // Reverse velocity with energy loss
            velocity = -velocity * bounceFactor

            // Stop tiny vibrations
            if abs(velocity) < 1 {
                velocity = 0
            }
        }
    }

    // MARK: - Dynamic Shadow

    func shadowScale() -> CGFloat {

        let normalized = max(0.4, 1 - (abs(ballY) / 600))

        return normalized
    }
}

#Preview {
    ContentView()
}
