//
//  VirtualObject.swift
//  ARKitScrum
//
//  Created by Belinda Carrera on 9/10/17.
//  Copyright © 2017 Belinda Carrera. All rights reserved.
//

import UIKit
import SceneKit

class VirtualObject: SCNNode {

    var objectName: String!
    var isPlaced: Bool = false
    
    override init() {
        super.init()
    }
    
    init(name objectName: String) {
        super.init()
        self.objectName = objectName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //Cargamos un objeto en la pantalla
    func loadModel() {
        guard let virtualObject = SCNScene(named: objectName, inDirectory: "art.scnassets", options: nil) else { return }
        
        let wrapperNode = SCNNode()
        for child in virtualObject.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .phong
            wrapperNode.addChildNode(child)
        }
        self.addChildNode(wrapperNode)
        
        isPlaced = true
    }
    
    //Eliminamos el objeto de la pantalla
    func unLoadModel(child: SCNNode) {
        child.removeFromParentNode()
        isPlaced = false
    }
}
