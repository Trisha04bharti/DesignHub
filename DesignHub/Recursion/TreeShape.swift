//
//  TreeShape.swift
//  DesignHub
//
//  Created by Vikram Kumar on 13/05/26.
//

import SwiftUI

struct RecursiveTreeView: View {
    var maxDepth: Int = 8
    var branchAngle: Double = 25

    var body: some View {
        GeometryReader { geo in
            Canvas { context, size in
                drawBranch(
                    context: context,
                    x: size.width / 2,
                    y: size.height - 40,
                    length: 90,
                    angleDeg: 0,
                    level: 1,
                    maxLevel: maxDepth
                )
            }
        }
    }

    func drawBranch(
        context: GraphicsContext,
        x: CGFloat,
        y: CGFloat,
        length: CGFloat,
        angleDeg: Double,
        level: Int,
        maxLevel: Int
    ) {
        guard level <= maxLevel else { return }

        let rad = angleDeg * .pi / 180
        let x2 = x + length * CGFloat(sin(rad))
        let y2 = y - length * CGFloat(cos(rad))

        // Trunk = brown, branches = green getting lighter
        let color: Color = level <= 2 ? Color(red: 0.48, green: 0.31, blue: 0.18)
                         : level <= 4 ? Color(red: 0.55, green: 0.39, blue: 0.25)
                         : Color(
                               red:   0.12,
                               green: Double(maxLevel - level) / Double(maxLevel) * 0.7 + 0.2,
                               blue:  0.08
                           )

        let lineWidth = max(1, CGFloat(maxLevel - level + 1) * 1.2)

        var path = Path()
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x2, y: y2))

        context.stroke(path, with: .color(color), lineWidth: lineWidth)

        // Recurse — left branch and right branch
        drawBranch(context: context, x: x2, y: y2, length: length * 0.72,
                   angleDeg: angleDeg - branchAngle, level: level + 1, maxLevel: maxLevel)

        drawBranch(context: context, x: x2, y: y2, length: length * 0.72,
                   angleDeg: angleDeg + branchAngle, level: level + 1, maxLevel: maxLevel)
    }
}

struct ContentView5: View {
    @State private var depth: Double = 8
    @State private var angle: Double = 25

    var body: some View {
        VStack(spacing: 16) {
            RecursiveTreeView(maxDepth: Int(depth), branchAngle: angle)
                .frame(height: 460)
                .background(Color(red: 0.97, green: 0.96, blue: 0.95))
                .cornerRadius(12)

            HStack {
                Text("Depth: \(Int(depth))")
                    .frame(width: 90, alignment: .leading)
                Slider(value: $depth, in: 1...12, step: 1)
            }
            .padding(.horizontal)

            HStack {
                Text("Angle: \(Int(angle))°")
                    .frame(width: 90, alignment: .leading)
                Slider(value: $angle, in: 10...60, step: 1)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview { ContentView() }
