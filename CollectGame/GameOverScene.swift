//
//  GameOverScene.swift
//  CollectGame
//
//  Created by Andreas Drivenes on 08.01.2016.
//  Copyright © 2016 Andreas Drivenes. All rights reserved.
//

import SpriteKit
import Foundation

class GameOverScene: StartGameScene {
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        let startGameLabel = SKLabelNode(fontNamed:"Chalkduster")
        startGameLabel.text = "Start game"
        startGameLabel.fontSize = 30
        startGameLabel.fontColor = SKColor.blueColor()
        startGameLabel.position = CGPointMake(size.width / 2, size.height / 2 - 30)
        startGameLabel.name = "startGame"
        addChild(startGameLabel)
        
        let gameOverLabel = SKLabelNode(fontNamed:"Chalkduster")
        gameOverLabel.text = "Game over!"
        gameOverLabel.fontSize = 40
        gameOverLabel.fontColor = SKColor.blackColor()
        gameOverLabel.position = CGPointMake(size.width / 2, size.height - 50)
        addChild(gameOverLabel)
        
    }
    
   }