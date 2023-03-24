//
//  Shape.swift
//  Paint
//
//  Created by Bekzhan on 27.10.2022.
//

import UIKit

class Shape {
    var color: UIColor = .systemOrange
    var isFilled: Bool = false
    var line_width: CGFloat?
    
    init(_ color: UIColor, _ isFilled: Bool, _ line_width: CGFloat) {
        self.color = color
        self.isFilled = isFilled
        self.line_width = line_width
    }
    
    func drawPath() { }
}
