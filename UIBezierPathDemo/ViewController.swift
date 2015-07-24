//
//  ViewController.swift
//  UIBezierPathDemo
//
//  Created by hw on 15/7/24.
//  Copyright (c) 2015年 hongw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonClick(sender: AnyObject) {
        
        let fromPath = UIBezierPath(ovalInRect: button.frame)
        
        let x = button.center.x
        let y = CGRectGetHeight(self.view.bounds) - button.center.y
        let radius = sqrt(x*x + y*y)
        
        let toRect = CGRectInset(button.frame, -100, -100)
        let toPath = UIBezierPath(ovalInRect: toRect)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = toPath.CGPath
        self.view.layer.mask = maskLayer
        
        let maskAnimation = CABasicAnimation(keyPath: "path")
        maskAnimation.fromValue = fromPath.CGPath
        maskAnimation.toValue = toPath.CGPath
        maskAnimation.duration = 0.5
        maskLayer.addAnimation(maskAnimation, forKey: "path")
    }
    
}

