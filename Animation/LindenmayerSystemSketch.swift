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
        
        
        var basicTree = Visualizer(fromJSONFile: "gordon-basic-branching-tree",
                                   drawingOn: self.canvas)
        
        // Render the tree
        //    basicTree.render()
        
        
        
        //Mr. Gordons Tree
        var systemGordon = LindenmayerSystem(axiom: "AF",
                                             rules: [ "F" : [
                                                Successor(odds: 1, text: "F[-F][+F]"),
                                                Successor(odds: 1, text: "  F[--F][+F]"),
                                                Successor(odds: 3, text: "F[-F][++F]"),
                                             ]
                                             
                                             ], generations: 4)
        
        var gordonVisualizedSystem = Visualizer(for: systemGordon,
                                                on: canvas,
                                                length: 60,
                                                reduction: 1.25,
                                                angle: 15,
                                                initialPosition: Point(x: 250, y: 50),
                                                initialHeading: 90)
        
        gordonVisualizedSystem.render()
        
        
        //Difine the L system
        var system = LindenmayerSystem(axiom: "[-F][+F]",
                                       rules: [
                                        "F": [
                                            Successor(odds: 3, text: "X[-G][+G][G]"),
                                            Successor(odds: 3, text: "XX[-G][+G][G]"),
                                            Successor(odds: 3, text: "XXX[-G][+G][G]"),
                                        ],
                                        "G": [
                                            Successor(odds: 3, text: "XXH[-H][+H]"),
                                            Successor(odds: 3, text: "XH[--H][+H]"),
                                            Successor(odds: 3, text: "XXXH[-H][++H]"),
                                        ],
                                        "H": [
                                            Successor(odds: 3, text: "XXI[-I][+I]"),
                                            Successor(odds: 3, text: "XI[--I][+I]"),
                                            Successor(odds: 3, text: "XXXI[-I][++I]"),
                                        ],
                                        "I": [
                                            Successor(odds: 3, text: "XXJ[-J][+J]"),
                                            Successor(odds: 3, text: "XJ[--J][+J]"),
                                            Successor(odds: 3, text: "XXXJ[-J][++J]"),
                                            Successor(odds: 1, text: "XXX[-XXB][+XB]"),
                                        ],
                                        "J": [
                                            Successor(odds: 1, text: "XXX[-XX][+X]"),
                                            Successor(odds: 3, text: "XX[-XXB][+XXX]"),
                                            Successor(odds: 1, text: "XXXX[-X][++XX]"),
                                        ],
                                       ],
                                       generations: 5)
        
        
        
        //Visualize the system
        var visualizedSystem = Visualizer(for: system,
                                          on: canvas,
                                          length: 15,
                                          reduction: 1.25,
                                          angle: 25,
                                          initialPosition: Point(x: 50, y: 50),
                                          initialHeading: 90)
        
        // Visualize second bush
        var secondVisualizedSystem = Visualizer(for: system,
                                                on: canvas,
                                                length: 15,
                                                reduction: 1.25,
                                                angle: 25,
                                                initialPosition: Point(x: 450, y: 50),
                                                initialHeading: 90)
        
        
        
        //Render the system
        visualizedSystem.render()
        secondVisualizedSystem.render()
        
        
        
        
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
