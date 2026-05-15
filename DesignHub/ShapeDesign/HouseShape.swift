//
//  HouseShape.swift
//  DesignHub
//
//  Created by Vikram Kumar on 15/05/26.
//

struct HousePathView: View {
    var body: some View {
        Path { path in
            // Roof (triangle)
            path.move(to: CGPoint(x: 100, y: 60))
            path.addLine(to: CGPoint(x: 200, y: 0))
            path.addLine(to: CGPoint(x: 300, y: 60))
            path.closeSubpath()

            // Body (rectangle)
            path.addRect(CGRect(
                x: 100, y: 60,
                width: 200, height: 150
            ))
        }
        .fill(.orange)
        .frame(width: 300, height: 250)
    }
}
