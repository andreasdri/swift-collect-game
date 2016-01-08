//
//  Utilities.swift
//  CollectGame
//
//  Created by Andreas Drivenes on 08.01.2016.
//  Copyright © 2016 Andreas Drivenes. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func getRandomFloat(low: CGFloat, high: CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(high))) + low
    }
    
    static func getRandomColor() -> UIColor {
        
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)

    }
}
