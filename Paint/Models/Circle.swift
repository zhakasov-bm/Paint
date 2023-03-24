//
//  Circle.swift
//  Paint
//
//  Created by Bekzhan on 27.10.2022.
//

import UIKit

class Circle: Shape{
    private var radius: CGFloat?
    private var circle_center: CGPoint?
    
    init(_ color: UIColor, _ isFilled: Bool, _ line_width: CGFloat, _ radius: CGFloat, _ circle_center: CGPoint) {
        super.init(color, isFilled, line_width)
        self.radius = radius
        self.circle_center = circle_center
    }
    
    
    override func drawPath() {
        let path = UIBezierPath(arcCenter: circle_center!, radius: radius!, startAngle: 0, endAngle: 2*Double.pi, clockwise: true)
        
        path.lineWidth = line_width!
        color.set()
        
        isFilled ? path.fill() : path.stroke()
    }
}

