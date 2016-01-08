//
//  GameScene.swift
//  CollectGame
//
//  Created by Andreas Drivenes on 08.01.2016.
//  Copyright (c) 2016 Andreas Drivenes. All rights reserved.
//

import SpriteKit
import Foundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var timer: NSTimer?
    private var touched: Bool = false
    private var location: CGPoint = CGPointMake(0, 0)
    private let player: RectangleSprite = RectangleSprite(color: SKColor.blackColor(),
        size: CGSizeMake(35, 10), category: SpriteCategory.Collector)
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        
        player.position = CGPoint(x: size.width / 2, y: 15)
        addChild(player)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector:"spawnColoredBox:",
            userInfo: nil, repeats: true)
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touched = true
        for touch in touches {
            location = touch.locationInNode(self)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Update to new touch location */
        for touch in touches {
            location = touch.locationInNode(self)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touched = false
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if (touched) {
            moveCollectorLeftOrRight()
        }
    }
    
    // Move Collector left or right
    func moveCollectorLeftOrRight() {
        // How fast to move the Collector
        let dx = location.x > player.position.x ? 3 as CGFloat : -3 as CGFloat
        player.position = CGPointMake(player.position.x+dx, player.position.y)
    }

    
    func spawnColoredBox(timer: NSTimer) {
        let width: CGFloat = Utilities.getRandomFloat(15, high: 30)
        let height: CGFloat = Utilities.getRandomFloat(15, high: 30)
        let boxSize = CGSizeMake(width, height)

        let box = RectangleSprite(color: Utilities.getRandomColor(), size: boxSize, category: SpriteCategory.ColoredBox)
        let y = size.height - box.size.height / 2
        let x = Utilities.getRandomFloat(box.size.width / 2, high: size.width - box.size.width / 2)
        box.position = CGPoint(x: x, y: y)
        self.addChild(box)
        
        let speed = Utilities.getRandomFloat(2, high: 4)
        
        // Create the actions
        let moveToBottom = SKAction.moveTo(CGPoint(x: x, y: 0), duration: NSTimeInterval(speed))
        let endOfMovement = SKAction.removeFromParent()
        let gameOver = SKAction.runBlock({
           self.gameOver()
        })

        box.runAction(SKAction.sequence([moveToBottom, gameOver, endOfMovement]))
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & SpriteCategory.ColoredBox.rawValue != 0) &&
            (secondBody.categoryBitMask & SpriteCategory.Collector.rawValue != 0)) {
                let box = firstBody.node as! RectangleSprite
                box.removeFromParent()
        }

    }
    
    func gameOver() {
        self.timer?.invalidate()
        self.timer = nil
        
        let gameScene = GameOverScene(size: size)
        gameScene.scaleMode = scaleMode
        let transitionType = SKTransition.flipHorizontalWithDuration(1.0)
        view?.presentScene(gameScene, transition: transitionType)

    }
    
}
