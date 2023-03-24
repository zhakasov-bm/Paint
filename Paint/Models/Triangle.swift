//
//  Triangle.swift
//  Paint
//
//  Created by Bekzhan on 27.10.2022.
//

import UIKit

class Triangle: Shape {
    var x: CGPoint = CGPoint(x: 0, y: 0)
    var x2: CGPoint = CGPoint(x: 0, y: 0)
    var x3: CGPoint = CGPoint(x: 0, y: 0)
    
    init(_ color: UIColor, _ isFilled: Bool, _ line_width: CGFloat, _ x: CGPoint, _ x2: CGPoint, _ x3: CGPoint) {
        super.init(color, isFilled, line_width)
        self.x = x
        self.x2 = x2
        self.x3 = x3
    }
    
    override func drawPath() {
        let path = UIBezierPath()
        path.move(to: x)
        path.addLine(to: x2)
        path.addLine(to: x3)
        
        path.close()
        
        path.lineWidth = line_width!
        color.set()
        
        isFilled ? path.fill() : path.stroke()
    }
}

