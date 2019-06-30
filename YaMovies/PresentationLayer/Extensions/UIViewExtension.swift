//
//  UIViewExtension.swift
//  YaMovies
//
//  Created by Beslan Tularov on 24/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import UIKit

extension UIView {
    
    func addParallaxMotionEffects(tiltValue : CGFloat = 0.25, panValue: CGFloat = 5) {
        
        var xTilt = UIInterpolatingMotionEffect()
        var yTilt = UIInterpolatingMotionEffect()
        
        var xPan = UIInterpolatingMotionEffect()
        var yPan = UIInterpolatingMotionEffect()
        
        let motionGroup = UIMotionEffectGroup()
        
        xTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .tiltAlongHorizontalAxis)
        xTilt.minimumRelativeValue = -tiltValue
        xTilt.maximumRelativeValue = tiltValue
        
        yTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .tiltAlongVerticalAxis)
        yTilt.minimumRelativeValue = -tiltValue
        yTilt.maximumRelativeValue = tiltValue
        
        xPan = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xPan.minimumRelativeValue = -panValue
        xPan.maximumRelativeValue = panValue
        
        yPan = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yPan.minimumRelativeValue = -panValue
        yPan.maximumRelativeValue = panValue
        
        motionGroup.motionEffects = [xTilt]
        self.addMotionEffect( motionGroup )
    }
}
