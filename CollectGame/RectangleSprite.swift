//
//  ColoredBox.swift
//  CollectGame
//
//  Created by Andreas Drivenes on 08.01.2016.
//  Copyright © 2016 Andreas Drivenes. All rights reserved.
//

import SpriteKit
import UIKit

class RectangleSprite: SKSpriteNode {
    
    init(color: UIColor, size: CGSize, category: SpriteCategory) {
        super.init(texture: nil, color: color, size: size)

        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody?.dynamic = true
        self.physicsBody?.categoryBitMask = category == SpriteCategory.ColoredBox ? category.rawValue : SpriteCategory.Collector.rawValue
        self.physicsBody?.contactTestBitMask = category == SpriteCategory.ColoredBox ? SpriteCategory.Collector.rawValue : category.rawValue
        self.physicsBody?.collisionBitMask = SpriteCategory.None.rawValue
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
