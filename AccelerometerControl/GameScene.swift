//  GameScene.swift
//  AccelerometerControl
//
//  Created by Holger Hinzberg on 23.10.18.
//  Copyright © 2018 Holger Hinzberg. All rights reserved.

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene
{
    var motionManager:CMMotionManager?
    var accelerometerControlX:HHSAccelerometerControl?
    var accelerometerControlY:HHSAccelerometerControl?
    var accelerometerControlZ:HHSAccelerometerControl?
    
    override init(size: CGSize)
    {
        super.init(size: size)
        
        self.backgroundColor = SKColor.black
        
        let controlsize = CGSize(width: 330, height: 20)
     
        var centerpoint = CGPoint(x: self.frame.size.width / 2 , y: self.frame.size.height / 2)
        accelerometerControlX = HHSAccelerometerControl(scene: self, size: controlsize, centerPoint: centerpoint)
        
        centerpoint = CGPoint(x: self.frame.size.width / 2 , y: (self.frame.size.height / 2) + 30)
        accelerometerControlY = HHSAccelerometerControl(scene: self, size: controlsize, centerPoint: centerpoint)
     
        centerpoint = CGPoint(x: self.frame.size.width / 2 , y: (self.frame.size.height / 2) - 30)
        accelerometerControlZ = HHSAccelerometerControl(scene: self, size: controlsize, centerPoint: centerpoint)
       
        motionManager = CMMotionManager()
        motionManager?.accelerometerUpdateInterval = 0.2
        motionManager?.startAccelerometerUpdates()
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        let x = self.motionManager?.accelerometerData?.acceleration.x
        if let accelerometerValue = x
        {
                self.accelerometerControlX?.setValue(value: accelerometerValue)
        }
        
        let y = self.motionManager?.accelerometerData?.acceleration.y
        if let accelerometerValue = y
        {
            self.accelerometerControlY?.setValue(value: accelerometerValue)
        }
        
        let z = self.motionManager?.accelerometerData?.acceleration.z
        if let accelerometerValue = z
        {
            self.accelerometerControlZ?.setValue(value: accelerometerValue)
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
