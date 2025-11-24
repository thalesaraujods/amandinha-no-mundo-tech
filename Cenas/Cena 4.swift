//
//  File.swift
//  
//
//  Created by Thales Araújo on 24/03/24.
//

import Foundation
import SpriteKit

class Cena4: SKScene, SKPhysicsContactDelegate {
    
    var background = SKSpriteNode(imageNamed: "cenario-1")
    var amandinha = Amandinha()
    var lucas = Lucas()
    let nextButton = SKSpriteNode(imageNamed: "botao")
    let quadroLaLand = SKSpriteNode(imageNamed: "lalaland")
    let quadrothegs = SKSpriteNode(imageNamed: "thegs")
    let quadroHamilton = SKSpriteNode(imageNamed: "hamilton")
    var mesa = SKSpriteNode(imageNamed: "mesa")
    var mesaAnimada: [SKTexture] = []
    var blackOverlay: SKSpriteNode?
    var computerScreen: SKSpriteNode!
    var textLabel: SKLabelNode!
    
    override func sceneDidLoad() {
        background.zPosition = 0
        addChild(background)
        
        amandinha.zPosition = 20
        amandinha.position.x = 0
        self.amandinha.animateCry()
        addChild(amandinha)
        
        mesa.name = "mesa"
        mesa.zPosition = 15
        mesa.position = CGPoint(x: 479, y: -195)
        addChild(mesa)
        
        let mesaAnimada1 = SKTexture(imageNamed: "amandinha-codando-1")
        let mesaAnimada2 = SKTexture(imageNamed: "amandinha-codando-2")
        let mesaAnimada3 = SKTexture(imageNamed: "amandinha-codando-3")
        mesaAnimada = [mesaAnimada1, mesaAnimada2, mesaAnimada3]
        
        quadroLaLand.position = CGPoint(x: -550, y: 270)
        quadroLaLand.zPosition = 0
        quadroLaLand.setScale(2.0)
        addChild(quadroLaLand)
        
        quadrothegs.position = CGPoint(x: 0, y: 270)
        quadrothegs.zPosition = 0
        quadrothegs.setScale(2.0)
        addChild(quadrothegs)
        
        quadroHamilton.position = CGPoint(x: 550, y: 270)
        quadroHamilton.zPosition = 0
        quadroHamilton.setScale(2.0)
        addChild(quadroHamilton)
        
        nextButton.name = "nextButton"
        nextButton.position = CGPoint(x: 868, y: -400)
        nextButton.zPosition = 10
        addChild(nextButton)
        
        // Adiciona um atraso de 5 segundos antes de criar e adicionar o nó à cena
        self.run(.sequence([
            .wait(forDuration: 5.0),
            .run {
                // Crie e adicione o nó à cena aqui
                self.lucas.zPosition = 0
                self.lucas.position = CGPoint(x: -750, y: -33)
                self.addChild(self.lucas)
            }
        ]))
        
        self.physicsWorld.contactDelegate = self
        
        //Definindo o corpo fisico de Amandinha
        let bodyAmandinha = SKPhysicsBody(rectangleOf: amandinha.amandinha!.size)
        bodyAmandinha.affectedByGravity = false
        
        bodyAmandinha.categoryBitMask = 1
        bodyAmandinha.contactTestBitMask = 1
        bodyAmandinha.collisionBitMask = 0
        amandinha.amandinha!.physicsBody = bodyAmandinha
        
        //Definindo o corpo fisico da mesa
        let bodyMesa = SKPhysicsBody(rectangleOf: mesa.size)
        bodyMesa.affectedByGravity = false
        
        bodyMesa.categoryBitMask = 4
        bodyMesa.contactTestBitMask = 1
        bodyMesa.collisionBitMask = 0
        mesa.physicsBody = bodyMesa
        
        //Definindo o corpo fisico do lucas
        let bodyLucas = SKPhysicsBody(rectangleOf: lucas.lucas!.size)
        bodyLucas.affectedByGravity = false
        
        bodyLucas.categoryBitMask = 2
        bodyLucas.contactTestBitMask = 1
        bodyLucas.collisionBitMask = 0
        lucas.lucas!.physicsBody = bodyLucas
    }
    
    override func didMove(to view: SKView) {
        
        // Crie e adicione a tela do computador à cena
        computerScreen = SKSpriteNode(imageNamed: "tela-computer")
        computerScreen.zPosition = 100
        computerScreen.position = CGPoint(x: 0, y: 0)
        //addChild(computerScreen)
        
        // Crie e adicione o rótulo de texto à tela do computador
        textLabel = SKLabelNode(fontNamed: "Arial")
        textLabel.text = "Hello World!"
        textLabel.fontSize = 150
        textLabel.fontColor = .black
        textLabel.position = CGPoint(x: 0, y: 75) // Ajuste conforme necessário
        //computerScreen.addChild(textLabel)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // Verifica se o contato foi entre Amandinha e a mesa
        if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 4) || (contact.bodyA.categoryBitMask == 4 && contact.bodyB.categoryBitMask == 1) {
            // Amandinha tocou na mesa
            print("Amandinha tocou na mesa")
            amandinha.alpha = 0
            animateMesa(speed: 0.01)
        }
        
        // Verifica se o contato foi entre Amandinha e Lucas
        if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 2) || (contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1) {
            // Lucas tocou em Amandinha
            print("Lucas tocou na Amandinha")
            lucas.removeAllActions()
            lucas.lucas!.removeAllActions()
            lucas.lucas!.texture = SKTexture(imageNamed: "lucas-run-2")
            amandinha.animateFront()
            
            self.run(.sequence([
                .wait(forDuration: 3.0),
                .run {
                    let locationMesa = self.mesa.position
                    self.amandinha.walkTo(position: locationMesa)
                    
                    let lucasTargetX = locationMesa.x - 400
                    self.lucas.xScale *= -1
                    self.lucas.walkTo(position: CGPoint(x: lucasTargetX, y: locationMesa.y))
                    self.darkenScreen()
                }
            ]))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let nodeAtPoint = self.nodes(at: touchLocation)
        
        for node in nodeAtPoint{
            if node.name == "nextButton"{
                transitionToNextScene()
            }
        }
        
        if !touches.isEmpty{
            let location = touches.first!.location(in: self)
            lucas.walkTo(position: location)
        }
    }
    
    func animateMesa(speed: TimeInterval) {
        mesa.run(.repeatForever(.animate(with: mesaAnimada, timePerFrame: speed)))
    }
    
//    func darkenScreen() {
//        blackOverlay = SKSpriteNode(color: UIColor.black, size: CGSize(width: size.width, height: size.height))
//        blackOverlay?.position = CGPoint(x: 0, y: 0)
//        blackOverlay?.zPosition = 20
//        blackOverlay?.alpha = 0
//        addChild(blackOverlay!)
//        
//        let fadeInAction = SKAction.fadeAlpha(to: 0.6, duration: 2.0)
//        blackOverlay?.run(fadeInAction)
//    }
    
    func darkenScreen() {
        blackOverlay = SKSpriteNode(color: UIColor.black, size: CGSize(width: size.width, height: size.height))
        blackOverlay?.position = CGPoint(x: 0, y: 0)
        blackOverlay?.zPosition = 20
        blackOverlay?.alpha = 0
        addChild(blackOverlay!)
        
        let fadeInAction = SKAction.fadeAlpha(to: 0.7, duration: 1.0)
        blackOverlay?.run(.sequence([
            fadeInAction,
            .wait(forDuration: 1.0), // Aguarda 3 segundos
            .run {
                // Adicione o nó da tela do computador à cena aqui
                self.addChild(self.computerScreen)
                //self.computerScreen.addChild(self.textLabel)
                
            },
            .wait(forDuration: 2.0),
            .run {
                self.computerScreen.addChild(self.textLabel)
            },
            .wait(forDuration: 3.0),
            .run {
                self.blackOverlay?.alpha = 0
                self.computerScreen.alpha = 0
                self.textLabel.alpha = 0
                self.lucas.alpha = 0
            },
        ]))
    }
    
    func transitionToNextScene () {
        let scene = Cena5(size: .init(width: 1920, height: 1080))
        scene.scaleMode = .aspectFit
        scene.setScale(0.6)
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        self.view?.presentScene(scene, transition: .crossFade(withDuration: 1.0))
    }
}
