//
//  File.swift
//  
//
//  Created by Thales Araújo on 22/03/24.
//

import Foundation
import SpriteKit

class Doctor: SKNode {
    var doctor: SKSpriteNode?
    
    override init() {
        self.doctor = SKSpriteNode(imageNamed: "doctor-1")
        let doctor1 = SKTexture(imageNamed: "doctor-1")
        doctor1.filteringMode = .nearest
        
        super.init()
        self.doctor!.position = CGPoint(x: 0, y: -345)
        doctor!.zPosition = 10
        addChild(doctor!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func walkTo(position: CGPoint) {
        doctor!.run(.moveTo(x: position.x+400, duration: 1))
    }
}
