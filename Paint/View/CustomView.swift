//
//  CanvasView.swift
//  Paint
//
//  Created by Bekzhan on 21.10.2022.
//

import UIKit

class CustomView: UIView {
    
    var pen: [Pen] = []
    var circles: [Circle] = []
    var rectangles: [Rectangle] = []
    var lines: [Line] = []
    var triangles: [Triangle] = []
    
    var color: UIColor = .systemOrange
    var isFill: Bool = false
    var selection = ""
    
    
    var startPoint: CGPoint = CGPoint(x: 0, y: 0)
    var endPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    
    func undo() {
        switch selection {
            case "circle": _ = circles.popLast()
            case "rectangle": _ = rectangles.popLast()
            case "line": _ = lines.popLast()
            case "triangle": _ = triangles.popLast()
            case "pen": _ = pen.popLast()
            default:
                print("undo tapped")
        }
        setNeedsDisplay()
    }
    
    func clear() {
        switch selection {
            case "circle": circles.removeAll()
            case "rectangle": rectangles.removeAll()
            case "line": lines.removeAll()
            case "triangle": triangles.removeAll()
            case "pen": pen.removeAll()
            default:
                print("")
        }
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        if(selection == "pen") {
            guard let context = UIGraphicsGetCurrentContext() else { return }
            
            for line in pen {
                
                context.setStrokeColor(line.strokeColor.cgColor)
                context.setLineWidth(line.strokeWidth)
                context.setLineCap(.round)
                
                for (index, point) in line.points.enumerated() {
                    if index == 0 {
                        context.move(to: point)
                    } else {
                        context.addLine(to: point)
                    }
                }
                
                context.strokePath()
            }
        }
        else if(selection == "circle") {
            for circle in circles {
                circle.drawPath()
            }
        }
        else if (selection == "rectangle") {
            for rectangle in rectangles {
                rectangle.drawPath()
            }
        }
        else if (selection == "line") {
            for line in lines {
                line.drawPath()
            }
        }
        else if (selection == "triangle") {
            for triangle in triangles {
                triangle.drawPath()
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let fingerLocation = touches.first?.location(in: self) else { return }
        
        startPoint = fingerLocation
        
        let newLine = Pen(points: [fingerLocation], strokeColor: color, strokeWidth: 5)
        pen.append(newLine)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(!selection.isEmpty && selection == "pen") {
            guard let fingerLocation = touches.first?.location(in: self) else { return }
            guard var lastLine = pen.popLast() else { return }
            
            lastLine.points.append(fingerLocation)
            pen.append(lastLine)
            
            
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(!selection.isEmpty) {
            guard let fingerLocation = touches.first?.location(in: self) else { return }
            
            endPoint = fingerLocation

            let width = CGFloat(endPoint.x - startPoint.x)
            let height = CGFloat(endPoint.y - startPoint.y)
            
            let circle_center = CGPoint(x: endPoint.x, y: endPoint.y)
            let radius = CGFloat(startPoint.x - endPoint.x)
            
            switch selection {
                case "circle": circles.append(Circle(color, isFill, 5, radius, circle_center))
                case "rectangle": rectangles.append(Rectangle(color, isFill, 5, CGRect(x: startPoint.x, y: startPoint.y, width: width, height: height)))
                case "line": lines.append(Line(color, false, 5, startPoint, endPoint))
                case "triangle": triangles.append(Triangle(color, isFill, 5, startPoint, CGPoint(x: startPoint.x, y: endPoint.y), endPoint))
                default:
                    print("from: \(startPoint), to: \(endPoint)")
            }
            
            
            setNeedsDisplay() }
    }
}

