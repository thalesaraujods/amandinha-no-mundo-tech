//
//  File.swift
//  
//
//  Created by Thales Araújo on 01/04/24.
//

import Foundation
import SpriteKit

class Personagem: SKNode {
    
    var person: SKSpriteNode?
    var front: [SKTexture] = []
    var cry: [SKTexture] = []
    var walkLeft: [SKTexture] = []
    var walkRight: [SKTexture] = []

    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateFront(animationTime: TimeInterval){
        let animation = SKAction.repeatForever(.animate(with: front, timePerFrame: animationTime))
        self.person?.run(animation)
    }
    
    func animateCry(animationTime: TimeInterval){
        let animation = SKAction.repeatForever(.animate(with: cry, timePerFrame: animationTime))
        self.person?.run(animation)
    }
    
    func animateWalk(animationTime: TimeInterval, position: CGPoint){
        if (position.x < self.position.x){
            self.run(.group([
                .run {self.person?.run(.repeatForever(.animate(with: self.walkLeft, timePerFrame: 0.1)))},
                .sequence([
                    .moveTo(x: position.x, duration: animationTime),
                    .run{
                        self.person?.removeAllActions()
                        self.animateFront(animationTime: 0.1)
                    }
                ])
            ]))
        }
        else {
            self.run(.group([
                .run {self.person?.run(.repeatForever(.animate(with: self.walkRight, timePerFrame: 0.1)))},
                .sequence([
                    .moveTo(x: position.x, duration: animationTime),
                    .run{
                        self.person?.removeAllActions()
                        self.animateFront(animationTime: animationTime)
                    }
                ])
            ]))
        }
    }
    
    func walkTest(position: CGPoint){
        let animation = SKAction.repeatForever(.animate(with: walkLeft, timePerFrame: 0.1))
        self.person?.run(animation)
    }
}
