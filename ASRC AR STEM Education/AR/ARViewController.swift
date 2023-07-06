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
    
    var collectionViewController: ItemCollectionViewController?
    
    var currentName = "default"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewController = (self.tabBarController?.viewControllers?[1] as! ItemCollectionViewController)
        
        arView.session.delegate = self
        
        let content = try! TestingSPHERE.loadSphere()
        arView.scene.anchors.append(content)
        
        let content2 = try! TestingSPHERE.loadShape()
        arView.scene.anchors.append(content2)
    }

    
    // MARK: - Unlock item in collection
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for i in 0...(anchors.count-1) {
            guard let imageAnchor = anchors[i] as? ARImageAnchor else { return }
            let refImage = imageAnchor.referenceImage
            self.currentName = refImage.name!
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // currentName format is like: reality:TestingSPHERE.reality/assets/QR code 1_6f326651.png
        
        // Remove the underscore and everything after
        let underscoreIndex = self.currentName.firstIndex(of: "_")
        var fileName = self.currentName[..<underscoreIndex!]
        
        // Remove everthing up to the second slash
        let qrIndex = self.currentName.firstIndex(of: "Q")
        fileName = fileName[qrIndex!...]
        
        if sender.tag == 0 {
            collectionViewController!.unlockItem(String(fileName))
        }
    }
    
}

