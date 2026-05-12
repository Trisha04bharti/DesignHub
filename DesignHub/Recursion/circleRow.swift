import SwiftUI

struct RecursiveCirclesView: View {
    var maxDepth: Int = 4

    var body: some View {
        GeometryReader { geo in
            Canvas { context, size in
                drawCircle(
                    context: context,
                    x: 90,
                    y: size.height / 2,
                    radius: 80,
                    level: 1,
                    maxLevel: maxDepth
                )
            }
        }
    }

    let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink]

    func drawCircle(
        context: GraphicsContext,
        x: CGFloat,
        y: CGFloat,
        radius: CGFloat,
        level: Int,
        maxLevel: Int
    ) {
        // Base case — stop recursion
        guard level <= maxLevel && radius >= 1 else { return }

        // Draw current circle
        let rect = CGRect(
            x: x - radius,
            y: y - radius,
            width: radius * 2,
            height: radius * 2
        )
        let path = Path(ellipseIn: rect)
        let color = colors[(level - 1) % colors.count]
        context.fill(path, with: .color(color))

        // Calculate where next circle starts
        let nextRadius = radius / 2
        let nextX = x + radius + nextRadius + 6  // gap of 6

        // Recurse with half the radius
        drawCircle(
            context: context,
            x: nextX,
            y: y,
            radius: nextRadius,
            level: level + 1,
            maxLevel: maxLevel
        )
    }
}

struct ContentView: View {
    @State private var depth: Double = 4

    var body: some View {
        VStack(spacing: 20) {
            RecursiveCirclesView(maxDepth: Int(depth))
                .frame(height: 220)
                .background(Color(red: 0.97, green: 0.96, blue: 0.95))
                .cornerRadius(12)

            HStack {
                Text("Depth: \(Int(depth))")
                    .frame(width: 80, alignment: .leading)
                Slider(value: $depth, in: 1...6, step: 1)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview { ContentView() }

