//
//  UIAppleTVMotionEffectGroup.swift
//  YaMovies
//
//  Created by Beslan Tularov on 30/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import UIKit

class UIAppleTVMotionEffectGroup : UIMotionEffectGroup{
    // size of shift movements
    let shiftDistance : CGFloat = 10.0
    let tiltAngle : CGFloat = CGFloat(M_PI_4) * 0.125
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        // Make horizontal movements shift the centre left and right
        let xShift = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
        xShift.minimumRelativeValue = shiftDistance * -1.0
        xShift.maximumRelativeValue = shiftDistance
        
        let yShift = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
        yShift.minimumRelativeValue = 0.0-shiftDistance
        yShift.maximumRelativeValue = shiftDistance
        
        let xTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
        
        var transMinimumTiltAboutY = CATransform3DIdentity
        transMinimumTiltAboutY.m34 = 1.0 / 500.0
        transMinimumTiltAboutY = CATransform3DRotate(transMinimumTiltAboutY, tiltAngle * -1.0, 0, 1, 0)
        
        var transMaximumTiltAboutY = CATransform3DIdentity
        transMaximumTiltAboutY.m34 = 1.0 / 500.0
        transMaximumTiltAboutY = CATransform3DRotate(transMaximumTiltAboutY, tiltAngle , 0, 1, 0)
        
        xTilt.minimumRelativeValue = transMinimumTiltAboutY
        xTilt.maximumRelativeValue = transMaximumTiltAboutY
        
        let yTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
        
        var transMinimumTiltAboutX = CATransform3DIdentity
        transMinimumTiltAboutX.m34 = 1.0 / 500.0
        transMinimumTiltAboutX = CATransform3DRotate(transMinimumTiltAboutX, tiltAngle * -1.0, 1, 0, 0)
        
        var transMaximumTiltAboutX = CATransform3DIdentity
        transMaximumTiltAboutX.m34 = 1.0 / 500.0
        transMaximumTiltAboutX = CATransform3DRotate(transMaximumTiltAboutX, tiltAngle , 1, 0, 0)
        
        yTilt.minimumRelativeValue = transMinimumTiltAboutX
        yTilt.maximumRelativeValue = transMaximumTiltAboutX
        
        self.motionEffects = [xShift,yShift,xTilt,yTilt]
        
    }
}
