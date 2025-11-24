//
//  Amanda.swift
//  Amandinha no Mundo Tech
//
//  Created by Thales Araújo on 02/04/24.
//

import Foundation
import SpriteKit

class Amanda: Personagem{
    
    override init() {
        super.init()
        
        //Adicionando o node
        self.person = SKSpriteNode(imageNamed: "amandinha-front-1")
        
        //Adicionando texturas nos vetores front, cry, walkLeft e walkRight
        for index in 1...2 {
            self.front.append(.init(imageNamed: "amandinha-front-\(index)"))
        }
        
        for index in 1...4 {
            self.cry.append(.init(imageNamed: "amandinha-chorando-\(index)"))
        }
        
        for index in 1...4 {
            self.walkLeft.append(.init(imageNamed: "amandinha-walk-left-\(index)"))
        }
        
        for index in 1...4 {
            self.walkRight.append(.init(imageNamed: "amandinha-walk-right-\(index)"))
        }
        
        //Adicionando filtro nas texturas dos vetores front, cry, walkLeft e walkRight
        for texture in cry {
            texture.filteringMode = .nearest
        }
        
        for texture in front {
            texture.filteringMode = .nearest
        }
        
        for texture in walkLeft {
            texture.filteringMode = .nearest
        }
        
        for texture in walkRight {
            texture.filteringMode = .nearest
        }
        
        self.person!.position = CGPoint(x: 0, y: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

