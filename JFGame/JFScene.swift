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
    
    var jButton: SKSpriteNode = SKSpriteNode()
    
    var cButton: SKSpriteNode  = SKSpriteNode()
    
    var fButton: SKSpriteNode  = SKSpriteNode()
    
    var leftButton: SKSpriteNode  = SKSpriteNode()
    
    var rightButton: SKSpriteNode  = SKSpriteNode()
    
    var j: () -> (Void) = {
        return
    }
    
    var c: () -> (Void) = {
        return
    }
    
    var f: () -> (Void) = {
        return
    }
    
    var left: () -> (Void) = {
        return
    }
    
    var right: () -> (Void) = {
        return
    }
    
    var functionsMap: [String: () -> (Void)] = [String: () -> (Void)]()
    
    var updateActions: [String] = [String]()
    
    
    var panel: SKNode = SKNode()
    
    override func didMove(to view: SKView) {
        HEIGHT = (self.view?.scene?.size.height)!
        WIDTH = (self.view?.scene?.size.width)!
        
        panel = SKSpriteNode(color: UIColor(red: CGFloat(37.0/255), green: CGFloat(150.0/255), blue: CGFloat(18.0/255), alpha: CGFloat(1.0)), size: CGSize(width: PANEL_WIDTH, height: PANEL_HEIGHT))
        panel.position = PANEL_POSITION
        
        jButton = SKSpriteNode(imageNamed: "JButton")
        jButton.size = CGSize(width: HEIGHT / 16, height: HEIGHT / 16)
        jButton.position = CGPoint(x: WIDTH * (15 / 100.0), y: PANEL_POSITION.y - PANEL_HEIGHT / 12)
        
        cButton = SKSpriteNode(imageNamed: "CButton")
        cButton.size = CGSize(width: HEIGHT / 16, height: HEIGHT / 16)
        cButton.position = CGPoint(x: WIDTH * (25 / 100.0), y: PANEL_POSITION.y + PANEL_HEIGHT / 5.7)
        
        fButton = SKSpriteNode(imageNamed: "FButton")
        fButton.size = CGSize(width: HEIGHT / 16, height: HEIGHT / 16)
        fButton.position = CGPoint(x: WIDTH * (35 / 100.0), y: PANEL_POSITION.y - PANEL_HEIGHT / 12)
        
        leftButton = SKSpriteNode(imageNamed: "RightButton")
        leftButton.size = CGSize(width: WIDTH / 5.5, height: HEIGHT / 18)
        leftButton.position = CGPoint(x: -WIDTH * (15 / 100.0), y: PANEL_POSITION.y + PANEL_HEIGHT / 16)
        
        rightButton = SKSpriteNode(imageNamed: "LeftButton")
        rightButton.size = CGSize(width: WIDTH / 5.5, height: HEIGHT / 18)
        rightButton.position = CGPoint(x: -WIDTH * (38 / 100.0), y: PANEL_POSITION.y + PANEL_HEIGHT / 16)
        
        functionsMap = [
            "j": j,
            "c": c,
            "f": f,
            "left": left,
            "right": right
        ]
        
        self.addChild(panel)
        self.addChild(rightButton)
        self.addChild(leftButton)
        self.addChild(jButton)
        self.addChild(cButton)
        self.addChild(fButton)
        
        if DEBUG {
            print(HEIGHT)
            print(WIDTH)
            print(PANEL_POSITION)
            print(CGSize(width: PANEL_WIDTH, height: PANEL_HEIGHT))
        }
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
