//
//  CanvasView.swift
//  DigitRecogniser
//
//  Created by Bhavin on 25/01/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    var lineColor: UIColor!
    var lineWidth: CGFloat!
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startingPoint: CGPoint!
    
    override func layoutSubviews() {
        print("Layouting")
        self.clipsToBounds = true
        self.isMultipleTouchEnabled = false
        self.lineColor = UIColor.white
        self.lineWidth = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touches began")
        let touch = touches.first
        startingPoint = touch?.location(in: self)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches moved")
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        startingPoint = touchPoint
        
        drawShapeLayer()
    }
    
    func drawShapeLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
    
    func clearCanvas(){
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
