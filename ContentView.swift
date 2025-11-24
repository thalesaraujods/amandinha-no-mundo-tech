import SwiftUI
import SpriteKit
//`import UIKit
//import PlaygroundSupport

struct ContentView: View {
    var challenge: Cena0{
        let challenge = Cena0(size: .init(width: 1920, height: 1080))
        challenge.anchorPoint = .init(x: 0.5, y: 0.5)
        challenge.scaleMode = .aspectFit
        challenge.setScale(0.6)
        return challenge
    }
    
    var body: some View {
       SpriteView(scene: challenge)
        .ignoresSafeArea()
    }
}
