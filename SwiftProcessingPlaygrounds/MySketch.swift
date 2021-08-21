import SwiftProcessing
import UIKit

class MySketch: Sketch, SketchDelegate {
    
    var ball: Ball!
    var paddle: Paddle!
    
    func setup() {
        ball = Ball(sketch: self)
        paddle = Paddle(sketch: self)
    }
    
    func draw() {
        background(0)
        ball.display()
        paddle.display()
        if collision(ball: ball, paddle: paddle) {
            ball.reverseY()
        }
    }
    
    func touchMoved() {
        paddle.moveTo(target: touchX)
    }
    
    func collision(ball: Ball, paddle: Paddle) -> Bool {
        return
            ((ball.x > paddle.x - paddle.width/2) &&
                (ball.x < paddle.x + paddle.width/2) &&
                (ball.y > paddle.y - paddle.height/2))
        
    }
 }

class Ball {
    var sketch: Sketch
    
    var size = 25
    var minSpeed = 1
    var maxSpeed = 10
    
    
    var x: Double
    var y: Double
    var speed: Sketch.Vector
    
    init(sketch: Sketch) {
        self.sketch = sketch
        
        self.x = sketch.random(size/2, sketch.width-size/2)
        self.y = sketch.random(size/2, sketch.height-size/2)
        
        self.speed = sketch.createVector(sketch.random(minSpeed, maxSpeed), sketch.random(minSpeed, maxSpeed))
        
        
    }
    
    func display() {
        sketch.fill(255)
        sketch.noStroke()
        sketch.circle(x, y, size)
        move()
        checkForWalls()
    }
    
    func move() {
        x += speed.x
        y += speed.y
    }
    
    func reverseY() {
        speed.y *= -1
    }
    
    func checkForWalls() {
        if x > sketch.width - size/2 || x < size/2 {
            speed.x *= -1
        }
        
        if y > sketch.height - size/2 || y < size/2 {
            speed.y *= -1
        }
    }
    
}

class Paddle {
    
    var sketch: Sketch
    
    var lerpAmount = 0.25
    
    var x: Double
    var y: Double
    var targetX: Double
    
    var width = 150
    var height = 30
    
    init(sketch: Sketch) {
        self.sketch = sketch
        self.x = sketch.width/2
        self.y = sketch.height - 60
        self.targetX = sketch.width/2
    }
    
    func display() {
        x = sketch.constrain(sketch.lerp(x, targetX, lerpAmount), width/2, sketch.width - width/2)
        sketch.fill(127)
        sketch.noStroke()
        sketch.rectMode(.center)
        sketch.rect(x,y, width, height)
    }
    
    func moveTo(target: Double) {
        self.targetX = target
    }
    
}


//class MySketch: Sketch, SketchDelegate {
//
//    var numFlies = 10
//    var fireflies = [Firefly]()
//
//    func setup() {
//        for _ in 0..<numFlies {
//            (fireflies.append(
//                Firefly(
//                color: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
//                location: Vector(random(width), random(height)),
//                sketch: self)))
//        }
//    }
//
//    func draw() {
//        (background(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
//        for fly in fireflies {
//            (fly.display())
//        }
//    }
//
//    func touchStarted() {
//        for fly in fireflies {
//            (fly.isOn = !fly.isOn)
//            (fly.isMoving = !fly.isMoving)
//        }
//        print(Firefly.count())
//    }
// }
//
//open class Firefly {
//    var sketch: Sketch
//
//    public static var howMany = 0
//
//    public var location: Sketch.Vector
//
//    public var color: Sketch.Color
//    public var isOn = true
//    public var isMoving = true
//    public var rotation: Double
//
//    public var walkSpeed = 4
//
//    public init(color: Sketch.Color, location: Sketch.Vector, sketch: Sketch) {
//        self.color = color
//        self.location = location
//        self.sketch = sketch
//
//        self.rotation = sketch.random(Sketch.Math.two_pi)
//
//        Firefly.howMany += 1
//    }
//
//    public func display() {
//        if (isMoving) {
//            (move())
//        }
//
//        (sketch.pushMatrix())
//
//        (sketch.translate(location.x, location.y))
//        (sketch.rotate(rotation))
//
//
//        if isOn {
//            (sketch.fill(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 0.3032388245)),
//             sketch.noStroke(),
//             sketch.circle(0, 0, 150))
//        }
//
//        (sketch.strokeWeight(30))
//
//        if isOn {
//            (sketch.stroke(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),
//            sketch.line(0, 20, 0, -20),
//            sketch.stroke(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)),
//            sketch.line(0, 0, 0, -20))
//        } else {
//            (sketch.stroke(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)),
//            sketch.line(0, 20, 0, -20))
//        }
//
//        (sketch.noStroke(),
//        sketch.fill(#colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 0.5)),
//        sketch.arc(0, 0, 100, 100, 0+0.1, Sketch.Math.pi/4),
//        sketch.arc(0, 0, 100, 100, Sketch.Math.pi/4 * 3, Sketch.Math.pi-0.1),
//        sketch.arc(0, 0, 100, 100, Sketch.Math.pi+0.1, Sketch.Math.pi/4*5),
//        sketch.arc(0, 0, 100, 100, Sketch.Math.pi/4 * 7, -0.1),
//
//        sketch.popMatrix())
//    }
//
//    public func move() {
//        // X random walk
//        location.x += sketch.random(-walkSpeed, walkSpeed)
//        if location.x > sketch.width + 75 { location.x = 0 }
//        if location.x < -75{ location.x = sketch.width }
//
//        // Y random walk
//        location.y += sketch.random(-walkSpeed, walkSpeed)
//        if location.y > sketch.height + 75 { location.y = 0 }
//        if location.y < -75 { location.y = sketch.height }
//
//        // rotation random walk
//        rotation += sketch.random(-0.25, 0.25)
//        if rotation > Sketch.Math.two_pi { (rotation = 0) }
//        if rotation < 0 { (rotation = Sketch.Math.two_pi) }
//    }
//
//    public static func count() -> String {
//        return "You've created \(Firefly.howMany) fireflies."
//    }
//}

//class MySketch: Sketch, SketchDelegate {
//
//    var positions = [Vector]()
//    let numCircles = 25
//    var circleColors = [Color]()
//    var startingSizes = [Double]()
//
//    func setup() {
//        for _ in 0..<numCircles {
//            positions.append(Vector(random(50, width-50), random(150, height-150)))
//            circleColors.append(color(random(255), random(255), random(255), random(50,150)))
//            startingSizes.append(random(250))
//        }
//
//        AudioIn.multiplier = 4.0
//        AudioIn.start()
//    }
//
//    func draw() {
//        background(0)
//        noStroke()
//        AudioIn.update()
//
//        for i in 0..<numCircles{
//            fill(circleColors[i])
//            circle(positions[i].x, positions[i].y, startingSizes[i] + AudioIn.getLevel())
//        }
//    }
//}

//
//    // https://developer.apple.com/documentation/uikit/mac_catalyst/handling_key_presses_made_on_a_physical_keyboard
//
//        override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
//            // Run backward or forward when the user presses a left or right arrow key.
//
//            var didHandleEvent = false
//            for press in presses {
//                guard let key = press.key else { continue }
//                if key.charactersIgnoringModifiers == UIKeyCommand.inputLeftArrow {
//                    print("left")
//                    didHandleEvent = true
//                }
//                if key.charactersIgnoringModifiers == UIKeyCommand.inputRightArrow {
//                    print("right")
//                    didHandleEvent = true
//                }
//            }
//
//            if didHandleEvent == false {
//                // Didn't handle this key press, so pass the event to the next responder.
//                super.pressesBegan(presses, with: event)
//            }
//        }
//}
