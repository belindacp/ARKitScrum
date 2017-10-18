//
//  ViewController.swift
//  ARKitScrum
//
//  Created by Belinda Carrera on 9/10/17.
//  Copyright © 2017 Belinda Carrera. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARKitViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet var sceneView: ARSCNView!
    let session = ARSession()

    var virtualObject = VirtualObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prevent the screen from being dimmed after a while.
        UIApplication.shared.isIdleTimerDisabled = true

        setupScene()
        
//        // Set the view's delegate
//        sceneView.delegate = self
//
//        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
//
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    func setupScene() {
        
        //set the view's delegate to tell our sceneView that this class is its delegate
        sceneView.delegate = self
        
        //set the session
        sceneView.session = session
        
        //Enables multisample antialiasing with four samples per screen pixel.
        sceneView.antialiasingMode = .multisampling4X
        
        sceneView.preferredFramesPerSecond = 60
        sceneView.contentScaleFactor = 1.3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
    @IBAction func addModelObject(_ sender: Any) {
        if !virtualObject.isPlaced {
            addObject()
        }
    }
    
    func addObject() {
        
        virtualObject = VirtualObject(name: "art.scnassets/ship.scn")
        virtualObject.loadModel()
    }
}
