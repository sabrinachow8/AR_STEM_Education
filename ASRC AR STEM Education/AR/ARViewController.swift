//
//  ViewController.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/14/23.
//

import UIKit
import ARKit
import RealityKit

class ARViewController: UIViewController, ARSessionDelegate {
    
    @IBOutlet var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the scene from the .rcproject
        let molAnchor = try! Realitycomposertest1.loadScene()
        
        // Add the anchor to the scene
        arView.scene.anchors.append(molAnchor)
        
        
    }
}

