//
//  dogShape.swift
//  DesignHub
//
//  Created by Vikram Kumar on 12/06/26.
//

import SwiftUI

struct DogShapeView: View {
    var body: some View {
        DogShape()
            .fill(.brown)
            .frame(width: 250, height: 250)
            .padding()
    }
}

struct DogShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.width
        let h = rect.height

        // Head
        path.addEllipse(
            in: CGRect(
                x: w * 0.25,
                y: h * 0.2,
                width: w * 0.5,
                height: h * 0.45
            )
        )

        // Left Ear
        path.move(to: CGPoint(x: w * 0.3, y: h * 0.25))
        path.addLine(to: CGPoint(x: w * 0.15, y: h * 0.05))
        path.addLine(to: CGPoint(x: w * 0.4, y: h * 0.2))
        path.closeSubpath()

        // Right Ear
        path.move(to: CGPoint(x: w * 0.7, y: h * 0.25))
        path.addLine(to: CGPoint(x: w * 0.85, y: h * 0.05))
        path.addLine(to: CGPoint(x: w * 0.6, y: h * 0.2))
        path.closeSubpath()

        // Body
        path.addRoundedRect(
            in: CGRect(
                x: w * 0.25,
                y: h * 0.55,
                width: w * 0.5,
                height: h * 0.25
            ),
            cornerSize: CGSize(width: 20, height: 20)
        )

        // Tail
        path.move(to: CGPoint(x: w * 0.75, y: h * 0.62))
        path.addQuadCurve(
            to: CGPoint(x: w * 0.95, y: h * 0.45),
            control: CGPoint(x: w * 0.95, y: h * 0.7)
        )

        return path
    }
}

#Preview {
    DogShapeView()
}
