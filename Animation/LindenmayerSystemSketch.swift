import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class LindenmayerSystemSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Enable faster rendering
        canvas.highPerformance = true
        
        
        
        // This is the background couldn't make it into a json file
        var Y = 0
        var X = 0
        var B = 20.0
        // Create the basic L-system
        for _ in  1...500 {
            
           
            
            var background = LindenmayerSystem(axiom: "0F",
                                               rules:[
                                                "F": [Successor(odds: 1, text: "0F")],
                                               ],
                                               generations: 1)
            
            
            var visualizedBackground = Visualizer(for: background,
                                            on: canvas,
                                            length: 500,
                                            reduction: 1,
                                            angle: 5,
                                            initialPosition: Point(x: X, y: Y),
                                            initialHeading: 0,
                                            colors: [
                                                "0" : LSColor(hue: 150, saturation: 90, brightness: Int(B), alpha: 100),])
            
            
            // Render the system
            visualizedBackground.render()
        
            
            Y += 1
            B += 0.16
            
        }
        
        
        
        
        
        var basicTree = Visualizer(fromJSONFile: "gordon-basic-branching-tree",
                                   drawingOn: self.canvas)
        
        // Render the tree
        basicTree.initialPosition = Point(x: 250, y: 50)
          // basicTree.render()
        
        
        //Cattail
        var XX = 40
        for _ in  1...8 {
        
        var catTail1 = Visualizer(fromJSONFile: "aidan-Cattail-sketch",
                                   drawingOn: self.canvas)
        
        // Render the tree
        catTail1.initialPosition = Point(x: XX, y: -10)
           catTail1.render()
        
     XX += 60
     
        }
        
       
        
        
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
