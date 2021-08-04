import SwiftProcessing
import UIKit

class MySketch: Sketch, SketchDelegate {
    
    var rotation = 0.0
    var increment = 0.0025
    
    var numLoops = 0
    
    func setup() {
        colorMode(.hsb)
        fill(random(360), 50, 100, 32)
        print("setup")
        settings.debugPrintSettings()
    }
    
    func draw() {
        (background(0),
        noStroke(),
        
        //push(), // This push is resetting the graphics context.
        rectMode(.center),
        translate(width/2, height/2),
        rotate(rotation),
        rect(0, 0, 1000, 1000),
        rotate(rotation),
        rect(0, 0, 900, 900),
        rotate(rotation),
        rect(0, 0, 800, 800),
        rotate(rotation),
        rect(0, 0, 700, 700),
        rotate(rotation),
        rect(0, 0, 600, 600),
        rotate(rotation),
        rect(0, 0, 500, 500),
        rotate(rotation),
        rect(0, 0, 400, 400),
        rotate(rotation),
        rect(0, 0, 300, 300),
        rotate(rotation),
        rect(0, 0, 200, 200),
        rotate(rotation),
        rect(0, 0, 100, 100),
        //pop(),
        
        rotation = rotation + increment)
        
//        numLoops += 1
//
//        if numLoops > 2 {
//          noLoop()
//        }
        
        noLoop()
    }
}


//
//import SwiftProcessing
//import UIKit
//
//class MySketch: Sketch, SketchDelegate {
//
//    let numPoints = 25
//    var randomPoints = [CGPoint]()
//
//    var xSpeed = [CGFloat]()
//    var ySpeed = [CGFloat]()
//
//    var xDir = [CGFloat]()
//    var yDir = [CGFloat]()
//
//    // Curve function for quality
//    // or an enum.
//
//    func setup() {
//        randomPoints = randomPoints(numPoints)
//
//        for _ in 0..<numPoints {
//            (xSpeed.append(random(1.0)))
//            (ySpeed.append(random(1.0)))
//
//            (xDir.append(random(-1.0, 1.0) > 0 ? 1.0 : -1.0))
//            yDir.append(random(-1.0, 1.0) > 0 ? 1.0 : -1.0)
//        }
//
//
//    }
//
//    func draw() {
////        background(0)
//
//        (noStroke(),
//        fill(0),
//        rect(0,0,width*2, height*2),
//
//        noFill(),
//        stroke(255))
//
//        (beginShape())
//        for p in randomPoints {
//            (curveVertex(p.x, p.y))
//        }
//        (endShape(CLOSE))
//
//        (fill(255, 0, 0))
//        (noStroke())
//        for p in randomPoints {
//            (circle(p.x, p.y, 15))
//        }
//
//        for i in 0..<randomPoints.count {
//            (randomPoints[i].x += (xSpeed[i] * xDir[i]))
//            (randomPoints[i].y += (ySpeed[i] * yDir[i]))
//            if randomPoints[i].x < 0 || randomPoints[i].x > CGFloat(width) {
//                (xDir[i] *= -1)
//            }
//
//            if randomPoints[i].y < 0 || randomPoints[i].y > CGFloat(height) {
//                (yDir[i] *= -1)
//            }
//        }
//    }
//
//
//    func randomPoints(_ number: Int) -> [CGPoint] {
//        var points = [CGPoint]()
//
//        for _ in 0..<number {
//            (points.append(CGPoint(x: random(width), y: random(height))))
//        }
//        return points
//    }
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
