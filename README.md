#  AccelerometerControl (SpriteKit)

The class HHSAccelerometerControl is used to display the current values of the CMMotionManager in a SpriteKit application.

## Sample useage


	import SpriteKit
	import GameplayKit
	import CoreMotion

	class GameScene: SKScene
	{
		var motionManager:CMMotionManager?
		var accelerometerControl:HHSAccelerometerControl?
	
		override init(size: CGSize)
		{
			super.init(size: size)
			
			self.backgroundColor = SKColor.black
			
			let controlsize = CGSize(width: 330, height: 20)
			
			var centerpoint = CGPoint(x: self.frame.size.width / 2 , y: self.frame.size.height / 2)
			accelerometerControl = HHSAccelerometerControl(scene: self, size: controlsize, centerPoint: centerpoint)
			
			motionManager = CMMotionManager()
			motionManager?.accelerometerUpdateInterval = 0.2
			motionManager?.startAccelerometerUpdates()
		}
	
		override func update(_ currentTime: TimeInterval)
		{
			let x = self.motionManager?.accelerometerData?.acceleration.x
			if let accelerometerValue = x
			{
				self.accelerometerControl?.setValue(value: accelerometerValue)
			}
		}
	
		required init?(coder aDecoder: NSCoder)
		{
			fatalError("init(coder:) has not been implemented")
		}
	}

## Changelog / History

**Version 1.0.0 (2019-07-09)**

- First public release

## Todo

- The number of segments  can not be modified

## Known Issues

- Nothing yet

## Tech Stack

- Swift
- SpriteKit
- Xcode
- macOS
