//
//  GameScene.swift
//  JFGameKit
//
//  Created by John Frye on 12/4/16.
//  Copyright © 2016 John Frye. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let DEBUG = true
    
    var HEIGHT: CGFloat = 0.0
    
    var WIDTH: CGFloat = 0.0
    
    var PANEL_HEIGHT: CGFloat {
        get {
            return (HEIGHT / 3.0)
        }
        set {
            self.PANEL_HEIGHT = newValue
        }
    }
    
    var PANEL_WIDTH: CGFloat {
        get {
            return WIDTH
        }
        set {
            self.PANEL_WIDTH = newValue
        }
    }
    
    var PANEL_POSITION: CGPoint {
        get {
            return CGPoint(x: 0.0, y: -(HEIGHT / 2.0) * (2.0/3))
        }
        set {
            self.PANEL_POSITION = newValue
        }
    }
    
    
    var panel: SKNode = SKNode()
    
    override func didMove(to view: SKView) {
        HEIGHT = (self.view?.scene?.size.height)!
        WIDTH = (self.view?.scene?.size.width)!
        
        if DEBUG {
            print(HEIGHT)
            print(WIDTH)
            print(PANEL_POSITION)
            print(CGSize(width: PANEL_WIDTH, height: PANEL_HEIGHT))
        }
        
        panel = SKSpriteNode(color: UIColor.blue, size: CGSize(width: PANEL_WIDTH, height: PANEL_HEIGHT))
        panel.position = PANEL_POSITION
        self.addChild(panel)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
