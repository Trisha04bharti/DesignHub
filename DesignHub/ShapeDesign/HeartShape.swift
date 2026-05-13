//
//  HeartShape.swift
//  DesignHub
//
//  Created by Vikram Kumar on 13/05/26.
//

import SwiftUI

struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.width
        let h = rect.height
        let cx = rect.midX   // center X
        let cy = rect.midY   // center Y

        // Start at the bottom tip
        path.move(to: CGPoint(x: cx, y: cy + h * 0.45))

        // Left curve — bottom tip → top left bump
        path.addCurve(
            to:      CGPoint(x: cx - w * 0.5, y: cy - h * 0.1),
            control1: CGPoint(x: cx - w * 0.2, y: cy + h * 0.25),
            control2: CGPoint(x: cx - w * 0.5, y: cy + h * 0.1)
        )

        // Left top arc — top left bump
        path.addCurve(
            to:      CGPoint(x: cx, y: cy - h * 0.1),
            control1: CGPoint(x: cx - w * 0.5, y: cy - h * 0.4),
            control2: CGPoint(x: cx - w * 0.1, y: cy - h * 0.35)
        )

        // Right top arc — top right bump
        path.addCurve(
            to:      CGPoint(x: cx + w * 0.5, y: cy - h * 0.1),
            control1: CGPoint(x: cx + w * 0.1, y: cy - h * 0.35),
            control2: CGPoint(x: cx + w * 0.5, y: cy - h * 0.4)
        )

        // Right curve — top right bump → bottom tip
        path.addCurve(
            to:      CGPoint(x: cx, y: cy + h * 0.45),
            control1: CGPoint(x: cx + w * 0.5, y: cy + h * 0.1),
            control2: CGPoint(x: cx + w * 0.2, y: cy + h * 0.25)
        )

        path.closeSubpath()
        return path
    }
}

struct ContentView6: View {
    var body: some View {
        HeartShape()
            .fill(Color.red)
            .frame(width: 200, height: 200)
    }
}

#Preview { ContentView() }
