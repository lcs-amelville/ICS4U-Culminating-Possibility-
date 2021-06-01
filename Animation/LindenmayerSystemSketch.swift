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
        
        // Draw a rock
        canvas.drawEllipse(at: Point(x: 450, y: 75), width: 55, height: 33)
        canvas.drawEllipse(at: Point(x: 50, y: 100), width: 65, height: 49)
        canvas.drawEllipse(at: Point(x: 230, y: 30), width: 90, height: 50)
        
        
       
        
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
        
        
        // Cattail level 2
        var XXX = 20
        for _ in  1...8 {
        
        var catTail2 = Visualizer(fromJSONFile: "aidan-Cattail-sketch",
                                   drawingOn: self.canvas)
        
        // Render the tree
        catTail2.initialPosition = Point(x: XXX, y: 75)
           catTail2.render()
        
     XXX += 60
     
        }
        
       
    // Add willow trees
        var willowTree = Visualizer(fromJSONFile: "aidan-willowTree-sketch",
                                   drawingOn: self.canvas)
        
        willowTree.initialPosition = Point(x:130 , y: 160)
          willowTree.render()
    // Willow Tree 2
        var willowTree2 = Visualizer(fromJSONFile: "aidan-willowTree-sketch",
                                   drawingOn: self.canvas)
        
        willowTree2.initialPosition = Point(x:420 , y: 150)
          willowTree2.render()
        
        
        
        //Try the fern
        var y = 100
        var x = 0
        for _ in  1...8 {
        
        var fern = Visualizer(fromJSONFile: "ilana-fern-plant",
                                   drawingOn: self.canvas)
        
        fern.initialPosition = Point(x: x, y: y)
        fern.render()
        
            x += 50
            y += 100
        }
        
        // Fern 2
        var yy = 100
        var xx = 500
        for _ in  1...8 {
        
        var fern = Visualizer(fromJSONFile: "ilana-fern-plant",
                                   drawingOn: self.canvas)
        
        fern.initialPosition = Point(x: xx, y: yy)
        fern.render()
        
            xx += -50
            yy += 100
        }
        
        var cherry = Visualizer(fromJSONFile: "Fernanda-Plan2",
                                   drawingOn: self.canvas)
        
        cherry.initialPosition = Point(x: 280, y: 160)
        cherry.render()


   }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
