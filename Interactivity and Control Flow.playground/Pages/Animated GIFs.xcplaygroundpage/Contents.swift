//: [Previous](@previous)
/*:
 # Animated GIFs
 ### by Masood Kamandy for GSoC 2021
 
 ## Introduction
 
 Whether you pronounce them "jifs" or "gifs" these files make animations fun. SwiftProcessing allows you to add GIFs to your projects like any other images and has some useful methods to help you control their animation.
 
 
 ## How about we use an image of Pluto? Make sure to tap around the image and see what happens to the background!
 
 */
import SwiftProcessing
import PlaygroundSupport
import UIKit

class MySketch: Sketch, SketchDelegate {
    
    var dance01, dance02, dance03, dance04: Image!
    
    func setup() {
        dance01 = loadImage("dance01")
        imageMode("center") // Draws images from their center point.
        background(255, 0, 0)
        dance01.play()
    }
    
    func draw() {
        image(dance01, center.x, center.y)
    }

}

//: ## Can you create a program that samples different areas randomly and sets of color palettes?
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(MySketch())
//:  ### Credit for image used in Tutorial
//: Source: [NASA/JHUAPL/SwRI](https://solarsystem.nasa.gov/resources/795/the-rich-color-variations-of-pluto/?category=planets/dwarf-planets_pluto)
//: [Next](@next)
