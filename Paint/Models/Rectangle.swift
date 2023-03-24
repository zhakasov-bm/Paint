//
//  Rectangle.swift
//  Paint
//
//  Created by Bekzhan on 27.10.2022.
//

import UIKit

class Rectangle: Shape {
    
    public var point: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    init(_ color: UIColor, _ isFilled: Bool, _ line_width: CGFloat, _ point: CGRect) {
        super.init(color, isFilled, line_width)
        self.point = point
    }
    
    override func drawPath() {
        let path = UIBezierPath(rect: point)
        path.lineWidth = line_width!
        color.set()

        isFilled ? path.fill() : path.stroke()
    }
}

