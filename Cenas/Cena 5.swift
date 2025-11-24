//
//  File.swift
//  
//
//  Created by Thales Araújo on 24/03/24.
//

import Foundation
import SpriteKit

class Cena5: SKScene, SKPhysicsContactDelegate {
    
    var background = SKSpriteNode(imageNamed: "cenario-4")
    let porta = SKSpriteNode(imageNamed: "porta")
    var amandinha = Amandinha()
    var blackOverlay: SKSpriteNode?
    var messageLabel: SKLabelNode?
    var message = "Mesmo diante das mudanças em seu percurso, a vontade de Amandinha em ajudar o próximo permaneceu intacta. Foi assim que Amandinha descobriu seu verdadeiro propósito: transformar vidas por meio do poder da tecnologia."
    var currentCharIndex = 0
    
    override func sceneDidLoad() {
        
        self.physicsWorld.contactDelegate = self
        
        background.zPosition = 0
        addChild(background)
        
        porta.zPosition = 10
        porta.position = CGPoint(x: 0, y: -326)
        addChild(porta)
        
        amandinha.zPosition = 10
        amandinha.setScale(0.5)
        amandinha.position = CGPoint(x: -840, y:-230)
        //amandinha.setScale(0.5)
        self.amandinha.animateFront()
        addChild(amandinha)
        
        //Definindo o corpo fisico de Amandinha
        let bodyAmandinha = SKPhysicsBody(rectangleOf: amandinha.amandinha!.size)
        bodyAmandinha.affectedByGravity = false
        
        bodyAmandinha.categoryBitMask = 1
        bodyAmandinha.contactTestBitMask = 1
        bodyAmandinha.collisionBitMask = 0
        amandinha.amandinha!.physicsBody = bodyAmandinha
        
        //Definindo o corpo fisico da porta
        let bodyPorta = SKPhysicsBody(rectangleOf: porta.size)
        bodyPorta.affectedByGravity = false
        
        bodyPorta.categoryBitMask = 2
        bodyPorta.contactTestBitMask = 1
        bodyPorta.collisionBitMask = 0
        porta.physicsBody = bodyPorta
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 2) || (contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1){
            // Amandinha tocou na porta
            print("iniciou contato 2")
            darkenScreen()
            animateMessage()
        }
    }
    
    func darkenScreen() {
        blackOverlay = SKSpriteNode(color: UIColor.black, size: CGSize(width: size.width, height: size.height))
        blackOverlay?.position = CGPoint(x: 0, y: 0)
        blackOverlay?.zPosition = 20
        blackOverlay?.alpha = 0
        addChild(blackOverlay!)
        
        let fadeInAction = SKAction.fadeAlpha(to: 0.95, duration: 1.5)
        blackOverlay?.run(fadeInAction)
    }
        
    func animateMessage() {
        messageLabel = SKLabelNode(fontNamed: "Times")
        messageLabel?.text = ""
        messageLabel?.preferredMaxLayoutWidth = 1500
        messageLabel?.numberOfLines = 10
        messageLabel?.fontSize = 55
        messageLabel?.fontColor = UIColor.white
        messageLabel?.position = CGPoint(x: 0 , y: -150)
        messageLabel?.zPosition = 50
        messageLabel?.alpha = 0
        addChild(messageLabel!)
        
        let fadeInAction = SKAction.fadeAlpha(to: 1.0, duration: 0.1)
        messageLabel?.run(fadeInAction) {
            self.animateCharacter()
        }
    }
        
    func animateCharacter() {
        guard currentCharIndex < message.count else { return }
        
        let char = message[message.index(message.startIndex, offsetBy: currentCharIndex)]
        messageLabel?.text?.append(char)
        currentCharIndex += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) {
            self.animateCharacter()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if touches.isEmpty{
            
        } else {
            let location = touches.first!.location(in: self)
            amandinha.walkTo(position: location)
        }
    }
}
