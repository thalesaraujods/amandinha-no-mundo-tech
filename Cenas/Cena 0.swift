//
//  File.swift
//  
//
//  Created by Thales Araújo on 26/03/24.
//

import Foundation
import SpriteKit

class Cena0: SKScene {
    let background = SKSpriteNode(imageNamed: "capa")
    let play = SKSpriteNode(imageNamed: "play")
    var blackOverlay: SKSpriteNode?
    var playOficial: [SKTexture] = []
    
    override func sceneDidLoad() {
        blackOverlay = SKSpriteNode(color: .black, size: CGSize(width: size.width, height: size.height))
        blackOverlay?.position = CGPoint(x: 0, y: 0)
        blackOverlay?.alpha = 1
        blackOverlay?.zPosition = 1
        addChild(blackOverlay!)
        
        background.zPosition = 5
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
        
        let play1 = SKTexture(imageNamed: "play")
        let play2 = SKTexture(imageNamed: "play-1")
        playOficial = [play1, play2]
        
        play.name = "play"
        play.setScale(0.6)
        play.position = CGPoint(x: 0, y: -300)
        play.zPosition = 5
        self.animatePlay()
        addChild(play)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let nodeAtPoint = self.nodes(at: touchLocation)
        
        for node in nodeAtPoint {
            if node.name == "play" {
                transitionToNextScene() 
            }
        }
    }
    
    func animatePlay(){
        play.run(.repeatForever(.animate(with: playOficial, timePerFrame: 0.1)))
    }
    
    func transitionToNextScene () {
        let scene = Cena1(size: .init(width: 1920, height: 1080))
        scene.scaleMode = .aspectFit
        scene.setScale(0.6)
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        self.view?.presentScene(scene, transition: .crossFade(withDuration: 1.0))
    }
    
}
