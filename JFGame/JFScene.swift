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
    
    var functionsMap: [String: () -> (Void)] = [String: () -> (Void)]()
    
    var buttons: [SKSpriteNode] = [SKSpriteNode]()
    
    var updateActions: Dictionary<String, UITouch?> = [
        "j": nil,
        "c": nil,
        "f": nil,
        "left": nil,
        "right": nil
    ]
    
    var panel: SKNode = SKNode()
    
    override func didMove(to view: SKView) {
        HEIGHT = (self.view?.scene?.size.height)!
        WIDTH = (self.view?.scene?.size.width)!
        
        panel = SKSpriteNode(color: UIColor(red: CGFloat(37.0/255), green: CGFloat(150.0/255), blue: CGFloat(18.0/255), alpha: CGFloat(1.0)), size: CGSize(width: PANEL_WIDTH, height: PANEL_HEIGHT))
        panel.position = PANEL_POSITION
        
        jButton = SKSpriteNode(imageNamed: "JButton")
        jButton.size = CGSize(width: HEIGHT / 16, height: HEIGHT / 16)
        jButton.position = CGPoint(x: WIDTH * (15 / 100.0), y: PANEL_POSITION.y - PANEL_HEIGHT / 12)
        jButton.name = "j"
        jButton.isUserInteractionEnabled = false
        
        cButton = SKSpriteNode(imageNamed: "CButton")
        cButton.size = CGSize(width: HEIGHT / 16, height: HEIGHT / 16)
        cButton.position = CGPoint(x: WIDTH * (25 / 100.0), y: PANEL_POSITION.y + PANEL_HEIGHT / 5.7)
        cButton.name = "c"
        cButton.isUserInteractionEnabled = false
        
        fButton = SKSpriteNode(imageNamed: "FButton")
        fButton.size = CGSize(width: HEIGHT / 16, height: HEIGHT / 16)
        fButton.position = CGPoint(x: WIDTH * (35 / 100.0), y: PANEL_POSITION.y - PANEL_HEIGHT / 12)
        fButton.name = "f"
        fButton.isUserInteractionEnabled = false
        
        leftButton = SKSpriteNode(imageNamed: "LeftButton")
        leftButton.size = CGSize(width: WIDTH / 5.5, height: HEIGHT / 18)
        leftButton.position = CGPoint(x: -WIDTH * (38 / 100.0), y: PANEL_POSITION.y + PANEL_HEIGHT / 16)
        leftButton.name = "left"
        leftButton.isUserInteractionEnabled = false
        
        rightButton = SKSpriteNode(imageNamed: "RightButton")
        rightButton.size = CGSize(width: WIDTH / 5.5, height: HEIGHT / 18)
        rightButton.position = CGPoint(x: -WIDTH * (15 / 100.0), y: PANEL_POSITION.y + PANEL_HEIGHT / 16)
        rightButton.name = "right"
        rightButton.isUserInteractionEnabled = false
        
        
        functionsMap = [
            "j": j,
            "c": c,
            "f": f,
            "left": left,
            "right": right
        ]
        
        buttons = [
            jButton,
            cButton,
            fButton,
            leftButton,
            rightButton
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
    
    func j() {
        print("j")
        return
    }
    
    func c() {
        print("c")
        return
    }
    
    func f() {
        print("f")
        return
    }
    
    func left() {
        print("left")
        return
    }
    
    func right() {
        print("right")
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            checkForTouchInNodes(touch: touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            killExistingTouch(touch: touch)
            checkForTouchInNodes(touch: touch)

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            killExistingTouch(touch: touch)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func checkForTouchInNodes(touch: UITouch) {
        let touchedNodes = self.nodes(at: touch.location(in: self))
        for node in touchedNodes {
            if let spritenode = node as? SKSpriteNode {
                if let name = spritenode.name {
                    for button in buttons {
                        if name == button.name {
                            updateActions[name] = touch
                        }
                    }
                }
            }
        }
    }
    
    func killExistingTouch(touch: UITouch) {
        for (action, _touch) in updateActions {
            if touch == _touch {
                updateActions[action] = nil
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if DEBUG {
            for (key, value) in updateActions {
                if value != nil {
                    print(key)
                }
            }
        }
        
        for (action, touch) in updateActions {
            if touch != nil {
                functionsMap[action]!()
            }
        }
    }
}
