//: [Previous](@previous)
/*:
 # Polygons and Curves
 ### by Masood Kamandy for GSoC 2021
 
 ## Introduction
 
 There are some more complex shapes that can't be drawn with the primitives. Imagine that you're tracing the silhoette of a body or that you're creating a complex figure with points that are generated by your program. For this purpose, we can create our own shapes.
 
 ## Basic Structure of a Shape
 
 When creating complex shapes in SwiftProcessing, you use the following structure:
 
 1. Use `beginShape()` to start your shape.
 1. Draw the vertices of your ship using `vertex(x, y)` for polygons or `curveVertex(x, y)` for curves.
 1. Use `endShape()` for an open shape or `endShape(.close)` for a closed shape.
 
 ## Polygons and Curves
 
 There are two types of shapes you can create in SwiftProcessing. One is the **polygon** and the other is a **curve**. Both polygons and curves can be constructed as **open** or **closed**.
 
 ### Polygons
 
 Here is a simple example of creating a **polygon** that is **open** with 5 random points. You can place this in `setup()` or `draw()` with different results.
 
 ```
 noFill()
 stroke(255)
 beginShape()
 for _ in 0..<5 {
     vertex(random(width), random(height))
 }
 endShape()
 ```
 
 ### Curve
 
 A similar **curve** can be created with the following code. This time let's **close** the shape.
 
 ```
 fill(255)
 stroke(255, 0 ,0)
 beginShape()
 for _ in 0..<5 {
     curveVertex(random(width), random(height))
 }
 endShape(.close)
 ```
 
 **Note**: The vertices of a curve are also called **control points.**
 
 ## Let's create a closed curve with control points that bounce around the screen.
 */
import SwiftProcessing
import PlaygroundSupport
import UIKit

// Note: This sketch is being sped up by the use of parentheses around each statement.

class MySketch: Sketch, SketchDelegate {
    
    let numPoints = 25
    var randomPoints = [CGPoint]()
    
    var xSpeed = [CGFloat]()
    var ySpeed = [CGFloat]()
    
    var xDir = [CGFloat]()
    var yDir = [CGFloat]()
    
    // Curve function for quality
    // or an enum.
    
    func setup() {
        
        // Call the function that generates random points (see bottom).
        (randomPoints = randomPoints(numPoints))
        
        // Generate random speeds and directions
        for _ in 0..<numPoints {
            (xSpeed.append(random(1.0)))
            (ySpeed.append(random(1.0)))
            
            (xDir.append(random(-1.0, 1.0) > 0 ? 1.0 : -1.0))
            (yDir.append(random(-1.0, 1.0) > 0 ? 1.0 : -1.0))
        }
        
        (colorMode(.hsb))
    }
    
    func draw() {
        (background(0))

        (noFill())
        (stroke(255))

        // Draw curves using random points.
        (beginShape())
        for p in randomPoints {
            (curveVertex(p.x, p.y))
        }
        (endShape(.close))
        
        // Draw control points as red circles.
        (fill(255, 0, 0))
        (noStroke())
        for p in randomPoints {
            (fill((map(p.y, 0, height, 0, 360)), 100, 100, 100))
//            (fill(360, 100, 100))
            (circle(p.x, p.y, 15))
        }

        // Move the points according to speed and direction until they hit an edge and then reverse.
        for i in 0..<randomPoints.count {
            (randomPoints[i].x += (xSpeed[i] * xDir[i]))
            (randomPoints[i].y += (ySpeed[i] * yDir[i]))
            if randomPoints[i].x < 0 || randomPoints[i].x > CGFloat(width) {
                (xDir[i] *= -1)
            }
            
            if randomPoints[i].y < 0 || randomPoints[i].y > CGFloat(height) {
                (yDir[i] *= -1)
            }
        }
    }
    
    // A custom function that returns an array of random points. We'll learn to write our own functions in a future playground!
    func randomPoints(_ number: Int) -> [CGPoint] {
        var points = [CGPoint]()
        
        for _ in 0..<number {
            (points.append(CGPoint(x: random(width), y: random(height))))
        }
        return points
    }
}
//: ## Can you change this playground to draw a polygon instead of a curve? How else can you customize this sketch?
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(MySketch())
//: [Next](@next)