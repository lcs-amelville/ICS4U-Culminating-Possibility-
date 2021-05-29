import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class catTail: NSObject, Sketchable {
   
    
    
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
        var catTailSystem = LindenmayerSystem(axiom: "0[FF][+FF][-FF][++F-F][--F+F]",
                                              rules: ["F":
                                                        [Successor(odds: 1, text: "1[GG][G-G]" ),
                                                         Successor(odds: 1, text: "1[G-G][G][G+]" ),
                                                         Successor(odds: 1, text: "1[G+G][G-G][G]" )
                                                        ],
                                                      "G": [Successor(odds: 1, text: "2L+V+L" ),
                                                            Successor(odds: 1, text: "2L-V-L" ),
                                                            Successor(odds: 1, text: "2VLL" )
                                                      ],
                                                      "L": [Successor(odds: 4, text: "3KK"),
                                                            Successor(odds: 1, text: "3KKKKB"),
                                                      ],
                                                     ],
                                              generations: 3)
 
    
    var visualizedCatTail = Visualizer(for: catTailSystem,
                                    on: canvas,
                                    length: 8,
                                    reduction: 1,
                                    angle: 10,
                                    initialPosition: Point(x: 100, y: 100),
                                    initialHeading: 90,
                                    colors: [
                                        "0" : LSColor(hue: 113, saturation: 100, brightness: 40, alpha: 100),
                                        "1" : LSColor(hue: 113, saturation: 100, brightness: 50, alpha: 100),
                                        "2" : LSColor(hue: 113, saturation: 100, brightness: 60, alpha: 100),
                                        "3" : LSColor(hue: 113, saturation: 100, brightness: 70, alpha: 100),
                                    ])
    
    // Render the system
    visualizedCatTail.render()
        
        visualizedCatTail.printJSONRepresentation()
        
    }
    
    func draw() {
        // This is empty
    }
    
}
