import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class willowTreeSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Enable faster rendering
        canvas.highPerformance = true
        
        // Create the basic L-system
        var willowTreeSystem = LindenmayerSystem(axiom: "0FFFF[++++L][----L]L",
                                                 rules: [
                                                    "L": [Successor(odds: 1, text: "0F[++G][--G]")],
                                                    
                                                    "G": [Successor(odds: 1, text: "0F[++FS][--FS]"),
                                                         Successor(odds: 2, text: "0F[+++FS][---FS]")],
                                                    
                                                    "S": [Successor(odds: 1, text: "3W[-F+FF][+F-FF][--F++FFF][++F--FFF]FFFF"),
                                                          Successor(odds: 2, text: "3W[-F+F][+F-F][--F++FF][++F--FF]FFF"),
                                                        Successor(odds: 1, text: "3W[-F+FFF][+F-FFF][--F++FFFF][++F--FFFF]FFFFF")],
                                                   ],
                                                   generations: 3)
                                                 
        
        // Visualize the system
        var visualizedWillowTree = Visualizer(for: willowTreeSystem,
                                        on: canvas,
                                        length: 30,
                                        reduction: 1,
                                        angle: 10,
                                        initialPosition: Point(x: 250, y: 100),
                                        initialHeading: 90,
                                        colors: [
                                            "0" : LSColor(hue: 34, saturation:69, brightness: 18, alpha: 100),
                                            "1" : LSColor(hue: 113, saturation: 100, brightness: 50, alpha: 100),
                                            "2" : LSColor(hue: 113, saturation: 100, brightness: 60, alpha: 100),
                                            "3" : LSColor(hue: 113, saturation: 100, brightness: 70, alpha: 100),
                                        ])
        
        // Render the system
        visualizedWillowTree.render()
        visualizedWillowTree.printJSONRepresentation()
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
