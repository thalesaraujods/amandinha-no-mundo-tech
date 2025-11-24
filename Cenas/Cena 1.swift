//
//  Cena 1.swift
//  Amandinha no Mundo Tech
//
//  Created by Thales Araújo on 19/03/24.
//

import Foundation
import SpriteKit

class Cena1: SKScene {
    
    var background = SKSpriteNode(imageNamed: "cenario-1")
    var amandinha = Amandinha()
    let nextButton = SKSpriteNode(imageNamed: "botao")
    let quadroLaLand = SKSpriteNode(imageNamed: "lalaland")
    let quadrothegs = SKSpriteNode(imageNamed: "thegs")
    let quadroHamilton = SKSpriteNode(imageNamed: "hamilton")
    var mesa = SKSpriteNode(imageNamed: "mesa")
    var blackOverlay: SKSpriteNode? // Nó para a camada preta
    var enlargedImage: SKSpriteNode?
    var tocouBotao = false
    
    override func sceneDidLoad() {
        background.zPosition = 0
        addChild(background)
        
        amandinha.zPosition = 20
        self.amandinha.animateFront()
        addChild(amandinha)
        
        mesa.zPosition = 15
        mesa.position = CGPoint(x: 479, y: -195)
        addChild(mesa)
        
        nextButton.name = "nextButton"
        nextButton.position = CGPoint(x: 868, y: -400)
        nextButton.zPosition = 10
        addChild(nextButton)
        
        quadroLaLand.name = "quadroLaLand"
        quadroLaLand.position = CGPoint(x: -550, y: 270)
        quadroLaLand.zPosition = 0
        quadroLaLand.setScale(2.0)
        addChild(quadroLaLand)
        
        quadrothegs.name = "quadrothegs"
        quadrothegs.position = CGPoint(x: 0, y: 270)
        quadrothegs.zPosition = 0
        quadrothegs.setScale(2.0)
        addChild(quadrothegs)
        
        quadroHamilton.name = "quadroHamilton"
        quadroHamilton.position = CGPoint(x: 550, y: 270)
        quadroHamilton.zPosition = 0
        quadroHamilton.setScale(2.0)
        addChild(quadroHamilton)
        
        
        
        // Crie o nó de cor preta semi-transparente
        blackOverlay = SKSpriteNode(color: .black, size: CGSize(width: size.width, height: size.height))
        blackOverlay?.position = CGPoint(x: 0, y: 0)
        blackOverlay?.alpha = 0 // Comece com opacidade 0
        blackOverlay?.zPosition = 20 // Coloque acima de todos os outros elementos
        addChild(blackOverlay!)
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let nodeAtPoint = self.nodes(at: touchLocation)
        
        for node in nodeAtPoint {
            
            if node.name == "quadroLaLand" {
                if !tocouBotao {
                    enlargedImage = SKSpriteNode(imageNamed: "lalaland")
                    enlargedImage?.zPosition = 30
                    enlargedImage?.position = CGPoint(x: -550, y: 270
                    )
                    enlargedImage!.setScale(4.0) // Ampliação (ajuste conforme necessário)
                    addChild(enlargedImage!)
                    tocouBotao = true
                }
                else {
                    enlargedImage!.removeFromParent()
                    enlargedImage = nil
                    tocouBotao = false
                }
                blackOverlay!.alpha = (enlargedImage != nil) ? 0.5 : 0
            }

            if node.name == "quadrothegs" {
                if !tocouBotao {
                    enlargedImage = SKSpriteNode(imageNamed: "thegs")
                    enlargedImage?.zPosition = 30
                    enlargedImage?.position = CGPoint(x: 0, y: 270)
                    enlargedImage!.setScale(4.0) // Ampliação (ajuste conforme necessário)
                    addChild(enlargedImage!)
                    tocouBotao = true
                }
                else {
                    enlargedImage!.removeFromParent()
                    enlargedImage = nil
                    tocouBotao = false
                }
                blackOverlay!.alpha = (enlargedImage != nil) ? 0.5 : 0
            }

            if node.name == "quadroHamilton" {
                if !tocouBotao {
                    enlargedImage = SKSpriteNode(imageNamed: "hamilton")
                    enlargedImage?.zPosition = 30
                    enlargedImage?.position = CGPoint(x: 550, y: 270)
                    enlargedImage!.setScale(4.0) // Ampliação (ajuste conforme necessário)
                    addChild(enlargedImage!)
                    tocouBotao = true
                }
                else {
                    enlargedImage!.removeFromParent()
                    enlargedImage = nil
                    tocouBotao = false
                }
                blackOverlay!.alpha = (enlargedImage != nil) ? 0.5 : 0
            }

            if node.name == "nextButton" {
                transitionToNextScene()
            }
        }
        if !touches.isEmpty{
            let location = touches.first!.location(in: self)
            amandinha.walkTo(position: location)
        }
    }
    
    func transitionToNextScene () {
        let scene = Cena2(size: .init(width: 1920, height: 1080))
        scene.scaleMode = .aspectFit
        scene.setScale(0.6)
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        self.view?.presentScene(scene, transition: .crossFade(withDuration: 1.0))
    }
}
