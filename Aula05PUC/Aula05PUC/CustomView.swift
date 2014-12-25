//
//  CustomView.swift
//  Aula05PUC
//
//  Created by Eduardo dos santos on 24/12/14.
//  Copyright (c) 2014 Eduardo dos santos. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable //Animações já na Storyboard

class CustomView: UIView {

    var backgroundLayer: CAShapeLayer!
    var lineWidth: Double = 0.0
    var pieOverLayer: CAShapeLayer!
    
    @IBInspectable var piePercentage:Double = 0.0
        {
        willSet(newPiePercentage) { updatePiePercentage(newPiePercentage)}
    }
    
    @IBInspectable var pieColor:UIColor = UIColor(red: 49/255, green: 209/255, blue: 102/255, alpha: 1)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lineWidth = Double(self.frame.size.width)/2
        
        if !(backgroundLayer != nil) {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
            
            
            let rect = CGRectInset(bounds, CGFloat(lineWidth / 2.0) ,CGFloat(lineWidth / 2.0))
            let path = UIBezierPath(ovalInRect: rect)
            
            backgroundLayer.path = path.CGPath
            
            backgroundLayer.fillColor = nil
            backgroundLayer.lineWidth = CGFloat(lineWidth)
            backgroundLayer.strokeColor = UIColor(white: 0.5, alpha: 0.3).CGColor
            
        }
        
        backgroundLayer.frame = layer.bounds
        
        
        if !(pieOverLayer != nil) {
            pieOverLayer = CAShapeLayer()
            layer.addSublayer(pieOverLayer)
            
            
            let rect = CGRectInset(bounds, CGFloat(lineWidth / 2.0) ,CGFloat(lineWidth / 2.0))
            let path = UIBezierPath(ovalInRect: rect)
            
            pieOverLayer.path = path.CGPath
            
            pieOverLayer.fillColor = nil
            pieOverLayer.lineWidth = CGFloat(lineWidth)
            pieOverLayer.strokeColor = pieColor.CGColor
            pieOverLayer.anchorPoint = CGPointMake(0.5, 0.5)
            
            pieOverLayer.transform = CATransform3DRotate(pieOverLayer.transform, CGFloat(-M_PI/2), 0, 0, 1)
            
            
        }
        
        pieOverLayer.frame = layer.bounds
        
        updateLayerProperties()
        
    }
    
    func updatePiePercentage(newPiePercentage: Double)
    {
        if (pieOverLayer != nil)
        {
            
            CATransaction.begin()
            var animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = ((newPiePercentage/100) - (self.piePercentage/100)) * 3
            animation.fromValue = self.piePercentage / 100
            animation.toValue = newPiePercentage / 100
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            
            CATransaction.setCompletionBlock({ () -> Void in
                CATransaction.begin()
                CATransaction.setValue(kCFBooleanTrue,forKey:kCATransactionDisableActions)
                self.pieOverLayer.strokeEnd = CGFloat(newPiePercentage / 100)
                CATransaction.commit()
                
            })
            
            self.pieOverLayer.addAnimation(animation, forKey: "animateStrokeEnd")
            
            CATransaction.commit()
            
        }
    }
    
    func updateLayerProperties()
    {
        if (pieOverLayer != nil)
        {
            self.pieOverLayer.strokeEnd = CGFloat( piePercentage / 100)
            
        }
    }


}
