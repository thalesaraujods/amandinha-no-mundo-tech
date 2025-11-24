//
//  File.swift
//  
//
//  Created by Thales Araújo on 19/03/24.
//

import Foundation
import SpriteKit

class Amandinha: SKNode {
    var amandinha: SKSpriteNode?
    var amandinhaFront: [SKTexture] = []
    var amandinhaWalk: [SKTexture] = []
    var amandinhaCry: [SKTexture] = []
    let scaleNode = SKNode() // Nodo para controle de escala
    
    override init() {
        
        super.init()
        
        self.amandinha = SKSpriteNode(imageNamed: "amandinha-front-1")
        
        let amandinhaFront1 = SKTexture(imageNamed: "amandinha-front-1")
        let amandinhaFront2 = SKTexture(imageNamed: "amandinha-front-2")
        amandinhaFront = [amandinhaFront1, amandinhaFront2]
        
        for index in 1...4 {
            self.amandinhaWalk.append(.init(imageNamed: "amandinha-run-\(index)"))
        }
        
        for index in 1...4 {
            self.amandinhaCry.append(.init(imageNamed: "amandinha-chorando-\(index)"))
        }
        
        for texture in amandinhaFront {
            texture.filteringMode = .nearest
        }
        
        for texture in amandinhaWalk {
            texture.filteringMode = .nearest
        }
        
        for texture in amandinhaCry {
            texture.filteringMode = .nearest
        }
        
        self.amandinha!.position = CGPoint(x: 0, y: -300)
        addChild(amandinha!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateFront() {
        amandinha?.run(.repeatForever(.animate(with: amandinhaFront, timePerFrame: 0.3)))
    }
    
    func animateCry() {
        amandinha?.run(.repeatForever(.animate(with: amandinhaCry, timePerFrame: 0.2)))
    }
    
    func walkTo(position: CGPoint) {
        if (position.x < self.position.x){
            self.run(.group([
                .run {
                    self.amandinha?.run(.repeatForever(.animate(with: self.amandinhaWalk, timePerFrame: 0.1)))
                },
                .sequence([
                    .moveTo(x: position.x, duration: 1),
                    .run{
                        self.amandinha?.removeAllActions()
                        self.amandinha?.texture = SKTexture(imageNamed: "amandinha-front-1")
                    }
                ])
            ]))
        } else{
            self.amandinha?.xScale *= -1
            self.run(.group([
                .run {
                    self.amandinha?.run(.repeatForever(.animate(with: self.amandinhaWalk, timePerFrame: 0.1)))
                },
                .sequence([
                    .moveTo(x: position.x, duration: 1),
                    .run{
                        self.amandinha?.removeAllActions()
                        self.amandinha?.texture = SKTexture(imageNamed: "amandinha-front-1")
                        self.amandinha?.xScale *= -1
                    }
                ])
            ]))
        }
    }
}
