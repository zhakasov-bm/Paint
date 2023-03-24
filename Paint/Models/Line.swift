//
//  Line.swift
//  Paint
//
//  Created by Bekzhan on 27.10.2022.
//

import UIKit

class Line: Shape {
    var startPoint = CGPoint(x: 0, y: 0)
    var endPoint = CGPoint(x: 0, y: 0)
    
    init(_ color: UIColor, _ isFilled: Bool, _ line_width: CGFloat, _ startPoint: CGPoint, _ endPoint: CGPoint) {
        super.init(color, isFilled, line_width)
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    override func drawPath() {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        path.lineWidth = line_width!
        color.set()
        path.stroke()
    }
}

