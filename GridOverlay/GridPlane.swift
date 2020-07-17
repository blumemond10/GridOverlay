import Foundation
import SceneKit
import ARKit

class GridPlane: SCNNode{
    var anchor : ARPlaneAnchor
    var planeGeometry : SCNPlane!
    
    init(anchor: ARPlaneAnchor) {
        self.anchor = anchor
        super.init()
        setup()
    }
    
    func update(anchor: ARPlaneAnchor){
        self.planeGeometry.width = CGFloat(anchor.extent.x)
        self.planeGeometry.height = CGFloat(anchor.extent.z)
        self.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
    }
    
    private func setup(){
        self.planeGeometry = SCNPlane(width: CGFloat(self.anchor.extent.x), height: CGFloat(self.anchor.extent.z))
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "overlay_grid.png")
         
        self.planeGeometry.materials = [material]
        
        let planenode = SCNNode(geometry: self.planeGeometry)
        planenode.position = SCNVector3Make(anchor.center.x,0,anchor.center.z)
        planenode.transform = SCNMatrix4MakeRotation(Float(-Double.pi / 2.0), 1.0, 0.0 , 0.0)
        
        self.addChildNode(planenode)
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("Fatal Error!")
    }
}
