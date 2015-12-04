//
//  UIColor+MyColors.swift
//  MusicPlayer2
//
//  Created by William Braynen on 12/4/15.
//  Copyright © 2015 Will Braynen. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    
    convenience init(red: Int, green: Int, blue: Int)
    {
        let newRed = CGFloat(red)/255.0
        let newGreen = CGFloat(green)/255.0
        let newBlue = CGFloat(blue)/255.0
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    
    public class func outerSpaceColor() -> UIColor  // 57, 70, 76 RGB
    {
        return UIColor( red: 57, green: 70, blue: 76 )
    }
}
