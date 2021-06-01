import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class Background: NSObject, Sketchable {
    
    
    func draw() {
        
    }
    
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Enable faster rendering
        canvas.highPerformance = true
        
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
            //visualizedBackground.printJSONRepresentation()
            
            Y += 1
            B += 0.16
            
        }
        
      
        
        
        
        
        
     
    }
}
