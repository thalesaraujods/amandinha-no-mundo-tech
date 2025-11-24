//
//  File.swift
//  
//
//  Created by Thales Araújo on 21/03/24.
//

import Foundation
import SpriteKit

class Cena2: SKScene, SKPhysicsContactDelegate {
    
    var background = SKSpriteNode(imageNamed: "cenario-2")
    var amandinha = Amandinha()
    var amigo = SKSpriteNode(imageNamed: "amigo-cinza")
    let nextButton = SKSpriteNode(imageNamed: "botao")
    let buraco = SKSpriteNode(imageNamed: "buraco")
    
    override func sceneDidLoad() {
        background.zPosition = 0
        addChild(background)
        
        amandinha.zPosition = 10
        self.amandinha.animateFront()
        addChild(amandinha)
        
        amigo.zPosition = 10
        amigo.position = CGPoint(x: -750, y: -335)
        let amigoCinza = SKTexture(imageNamed: "amigo-cinza")
        let amigoColor = SKTexture(imageNamed: "amigo-colorido")
        addChild(amigo)
        
        buraco.name = "buraco"
        buraco.zPosition = 10
        buraco.position = CGPoint(x: 868, y: -400)
        addChild(buraco)
        
        
//        nextButton.name = "nextButton"
//        nextButton.position = CGPoint(x: 868, y: -400)
//        nextButton.zPosition = 10
//        addChild(nextButton)
        
        self.physicsWorld.contactDelegate = self
        
        //Definindo o corpo fisico de Amandinha
        let bodyAmandinha = SKPhysicsBody(rectangleOf: amandinha.amandinha!.size)
        bodyAmandinha.affectedByGravity = false
        
        bodyAmandinha.categoryBitMask = 1
        bodyAmandinha.contactTestBitMask = 1
        bodyAmandinha.collisionBitMask = 0
        amandinha.amandinha!.physicsBody = bodyAmandinha
        
        //Definindo o corpo fisico do buraco
        let bodyBuraco = SKPhysicsBody(rectangleOf: buraco.size)
        bodyBuraco.affectedByGravity = false
        
        bodyBuraco.categoryBitMask = 4
        bodyBuraco.contactTestBitMask = 1
        bodyBuraco.collisionBitMask = 0
        buraco.physicsBody = bodyBuraco
        
        //Definindo o corpo fisico do amigo
        let bodyAmigo = SKPhysicsBody(rectangleOf: amigo.size)
        bodyAmigo.affectedByGravity = false
        
        bodyAmigo.categoryBitMask = 2
        bodyAmigo.contactTestBitMask = 1
        bodyAmigo.collisionBitMask = 0
        amigo.physicsBody = bodyAmigo
        
        
    }
    
//    func didBegin(_ contact: SKPhysicsContact) {
//        print("iniciou contato")
//        transitionToNextScene ()
//    }
    
    func didBegin(_ contact: SKPhysicsContact) {
       // Verifica se o contato foi entre Amandinha e o amigo
       if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 2) || (contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1) {
           // Amandinha tocou no amigo, faça algo aqui
           print("Amandinha tocou no amigo")
           amigo.texture = SKTexture(imageNamed: "amigo-colorido")
           //amandinha.amandinha?.removeAllActions()
           amandinha.removeAllActions()
           amandinha.amandinha?.removeAllActions()
           amandinha.amandinha!.texture = SKTexture(imageNamed: "amandinha-run-2")
       }
       
       // Verifica se o contato foi entre Amandinha e o buraco
       if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 4) || (contact.bodyA.categoryBitMask == 4 && contact.bodyB.categoryBitMask == 1) {
           // Amandinha tocou no buraco, faça algo aqui, como transição para a próxima cena
           print("Amandinha caiu no buraco")
           transitionToNextScene()
       }
   }
    
    func didEnd(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 2) || (contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1) {
            // Amandinha se afastou do amigo
            print("Amandinha se afastou do amigo")
            amigo.texture = SKTexture(imageNamed: "amigo-cinza")
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let nodeAtPoint = self.nodes(at: location)
            for node in nodeAtPoint{
                if node.name == "nextButton"{
                    transitionToNextScene()
                }
            }
        }
        
        if touches.isEmpty{
            
        } else {
            let location = touches.first!.location(in: self)
            amandinha.walkTo(position: location)
        }
    }
    
    func transitionToNextScene () {
        let scene = Cena3(size: self.size)
        scene.scaleMode = .aspectFit
        scene.setScale(0.6)
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        self.view?.presentScene(scene, transition: .crossFade(withDuration: 1.0))
    }
}
