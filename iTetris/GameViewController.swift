//
//  GameViewController.swift
//  iTetris
//
//  Created by Bernardo Silva on 30/10/2014.
//  Copyright (c) 2014 Bernardo Silva. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController, ITetrisDelegate, UIGestureRecognizerDelegate {
    
    var scene: GameScene!
    var iTetris:ITetris!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as SKView;
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        scene.tick = didTick
        
        iTetris = ITetris()
        iTetris.delegate = self
        iTetris.beginGame()
        
        // Present the scene.
        skView.presentScene(scene)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        iTetris.rotateShape()
    }
    
    func didTick() {
        iTetris.letShapeFall()
    }
    
    
    func nextShape() {
        let newShapes = iTetris.newShape()
        if let fallingShape = newShapes.fallingShape {
            self.scene.addPreviewShapeToScene(newShapes.nextShape!) {}
            self.scene.movePreviewShape(fallingShape) {
                // #2
                self.view.userInteractionEnabled = true
                self.scene.startTicking()
            }
        }
    }
    
    func gameDidBegin(iTetris: ITetris) {
        // The following is false when restarting a new game
        if iTetris.nextShape != nil && iTetris.nextShape!.blocks[0].sprite == nil {
            scene.addPreviewShapeToScene(iTetris.nextShape!) {
                self.nextShape()
            }
        } else {
            nextShape()
        }
    }
    
    func gameDidEnd(iTetris: ITetris) {
        view.userInteractionEnabled = false
        scene.stopTicking()
    }
    
    func gameDidLevelUp(iTetris: ITetris) {
        
    }
    
    func gameShapeDidDrop(iTetris: ITetris) {
        
    }
    
    func gameShapeDidLand(iTetris: ITetris) {
        scene.stopTicking()
        nextShape()
    }
    
    // #3
    func gameShapeDidMove(iTetris: ITetris) {
        scene.redrawShape(iTetris.fallingShape!) {}
    }
}
