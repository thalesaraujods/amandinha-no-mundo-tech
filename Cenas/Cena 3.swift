//
//  File.swift
//  
//
//  Created by Thales Araújo on 22/03/24.
//

import Foundation
import SpriteKit

class Cena3: SKScene, SKPhysicsContactDelegate {
    
    var background = SKSpriteNode(imageNamed: "cenario-3")
    var amandinha = Amandinha()
    var doente = SKSpriteNode(imageNamed: "doente-1")
    var doctor = Doctor()
    let nextButton = SKSpriteNode(imageNamed: "botao")
    
    
    override func sceneDidLoad() {
        background.zPosition = 0
        addChild(background)
        
        amandinha.zPosition = 10
        amandinha.position.x = -400
        addChild(amandinha)
        
        nextButton.name = "nextButton"
        nextButton.position = CGPoint(x: 868, y: -400)
        nextButton.zPosition = 10
        addChild(nextButton)
        
        //let doente1 = SKTexture(imageNamed: "doente-1")
        //let doente2 = SKTexture(imageNamed: "doente-2")
        doente.name = "doente"
        doente.position = CGPoint(x: 400, y: -345)
        doente.zPosition = 10
        addChild(doente)
        
        doctor.zPosition = 10
        doctor.position = CGPoint(x: -750, y: 40)
        addChild(doctor)
        
        self.physicsWorld.contactDelegate = self
        
        //Definindo o corpo fisico de Amandinha
        let bodyAmandinha = SKPhysicsBody(rectangleOf: amandinha.amandinha!.size)
        bodyAmandinha.affectedByGravity = false
        
        bodyAmandinha.categoryBitMask = 1
        bodyAmandinha.contactTestBitMask = 1
        bodyAmandinha.collisionBitMask = 0
        amandinha.amandinha!.physicsBody = bodyAmandinha
        
        //Definindo o corpo fisico do doente
        let bodySick = SKPhysicsBody(rectangleOf: doente.size)
        bodySick.affectedByGravity = false        
        bodySick.categoryBitMask = 1
        bodySick.contactTestBitMask = 1
        bodySick.collisionBitMask = 0
        
        doente.physicsBody = bodySick
//        
//        
//        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("iniciou contato")
        amandinha.removeAllActions()
        doente.texture = SKTexture(imageNamed: "doente-2")
        //amandinha.texture = SKTexture(imageNamed: "amandinha-run-2")
        amandinha.animateCry()
    }
    func didEnd(_ contact: SKPhysicsContact) {
        print("terminou contato")
        //doente.texture = SKTexture(imageNamed: "doente-1")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !touches.isEmpty{
            let location = touches.first!.location(in: self)
            amandinha.walkTo(position: location)
            //doctor.removeAllActions()
        }
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let nodeAtPoint = self.nodes(at: location)
            for node in nodeAtPoint{
                if node.name == "nextButton"{
                    transitionToNextScene()
                }
            }
        }
        
        
    }
    
    func transitionToNextScene () {
        let scene = Cena4(size: self.size)
        scene.scaleMode = .aspectFit
        scene.setScale(0.6)
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        self.view?.presentScene(scene, transition: .crossFade(withDuration: 1.0))
    }
}
