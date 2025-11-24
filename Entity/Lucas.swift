//
//  File.swift
//  
//
//  Created by Thales Araújo on 25/03/24.
//

import Foundation
import SpriteKit

class Lucas: SKNode {
    var lucas: SKSpriteNode?
    var lucasFront: [SKTexture] = []
    var lucasWalk: [SKTexture] = []
    let scaleNode = SKNode() // Nodo para controle de escala
    
    override init() {
        
        super.init()
        
        self.lucas = SKSpriteNode(imageNamed: "lucas-front-1")
        
        let lucasFront1 = SKTexture(imageNamed: "lucas-front-1")
        let lucasFront2 = SKTexture(imageNamed: "lucas-front-2")
        lucasFront = [lucasFront1, lucasFront2]
        
        for index in 1...4 {
            self.lucasWalk.append(.init(imageNamed: "lucas-run-\(index)"))
        }
        
        for texture in lucasFront {
            texture.filteringMode = .nearest
        }
        
        for texture in lucasWalk {
            texture.filteringMode = .nearest
        }
        
        self.lucas!.position = CGPoint(x: 0, y: -300)
        addChild(lucas!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateFront() {
        lucas?.run(.repeatForever(.animate(with: lucasFront, timePerFrame: 0.3)))
    }
    
    func walkTo(position: CGPoint) {
        if (position.x < self.position.x){
            self.run(.group([
                .run {
                    self.lucas?.run(.repeatForever(.animate(with: self.lucasWalk, timePerFrame: 0.1)))
                },
                .sequence([
                    .moveTo(x: position.x, duration: 1),
                    .run{
                        self.lucas?.removeAllActions()
                        self.lucas?.texture = SKTexture(imageNamed: "lucas-front-1")
                    }
                ])
            ]))
        } else{
            self.lucas?.xScale *= -1
            self.run(.group([
                .run {
                    self.lucas?.run(.repeatForever(.animate(with: self.lucasWalk, timePerFrame: 0.1)))
                },
                .sequence([
                    .moveTo(x: position.x, duration: 1),
                    .run{
                        self.lucas?.removeAllActions()
                        self.lucas?.texture = SKTexture(imageNamed: "lucas-front-1")
                        self.lucas?.xScale *= -1
                    }
                ])
            ]))
        }
    }
}

