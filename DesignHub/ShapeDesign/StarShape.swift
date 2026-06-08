//
//  StarShape.swift
//  DesignHub
//
//  Created by Vikram Kumar on 08/06/26.
//

import SwiftUI

struct StarShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(
            x: rect.midX,
            y: rect.midY
        )
        
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * 0.4
        
        var path = Path()
        
        for i in 0..<10 {
            let angle = Double(i) * .pi / 5 - .pi / 2
            
            let radius = i.isMultiple(of: 2)
                ? outerRadius
                : innerRadius
            
            let point = CGPoint(
                x: center.x + CGFloat(cos(angle)) * radius,
                y: center.y + CGFloat(sin(angle)) * radius
            )
            
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        path.closeSubpath()
        return path
    }
}
