//
//  triangle.swift
//  DesignHub
//
//  Created by Vikram Kumar on 06/06/26.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))     // Top
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))  // Bottom right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))  // Bottom left
        path.closeSubpath()

        return path
    }
}

struct DownTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()

        return path
    }
}
