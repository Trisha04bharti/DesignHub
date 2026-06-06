//
//  triangle.swift
//  DesignHub
//
//  Created by Vikram Kumar on 06/06/26.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))     // Top
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))  // Bottom right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))  // Bottom left
        path.closeSubpath()

        return path
    }
}
