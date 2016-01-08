//
//  StartGameScene.swift
//  CollectGame
//
//  Created by Andreas Drivenes on 08.01.2016.
//  Copyright © 2016 Andreas Drivenes. All rights reserved.
//

import SpriteKit
import Foundation

class StartGameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        let startGameLabel = SKLabelNode(fontNamed:"Chalkduster")
        startGameLabel.text = "Start game"
        startGameLabel.fontSize = 30
        startGameLabel.fontColor = SKColor.blueColor()
        startGameLabel.position = CGPointMake(size.width / 2, size.height / 2 - 30)
        startGameLabel.name = "startGame"
        addChild(startGameLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.locationInNode(self)
        let touchedNode = self.nodeAtPoint(touchLocation)
        
        if(touchedNode.name == "startGame"){
            let gameScene = GameScene(size: size)
            gameScene.scaleMode = scaleMode
            let transitionType = SKTransition.flipHorizontalWithDuration(1.0)
            view?.presentScene(gameScene, transition: transitionType)
        }
    }
}
