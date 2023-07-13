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
        
        self.collectionViewController = (self.tabBarController?.viewControllers?[0] as! ItemCollectionViewController)
        
        arView.session.delegate = self
        
        // Load all the AR models from the Reality Composer project
        
        // Protein structure:
        let content = try! ARModels.loadScene1()
        arView.scene.anchors.append(content)
        let content2 = try! ARModels.loadScene2()
        arView.scene.anchors.append(content2)
        let content3 = try! ARModels.loadScene3()
        arView.scene.anchors.append(content3)
        let content4 = try! ARModels.loadScene4()
        arView.scene.anchors.append(content4)
        let content5 = try! ARModels.loadScene5()
        arView.scene.anchors.append(content5)
        
        // Crystallization:
        let content6 = try! ARModels.loadScene6()
        arView.scene.anchors.append(content6)
        let content7 = try! ARModels.loadScene7()
        arView.scene.anchors.append(content7)
        let content8 = try! ARModels.loadScene8()
        arView.scene.anchors.append(content8)
        let content9 = try! ARModels.loadScene9()
        arView.scene.anchors.append(content9)
        
        // ASRC:
        let content10 = try! ARModels.loadScene10()
        arView.scene.anchors.append(content10)
        let content11 = try! ARModels.loadScene11()
        arView.scene.anchors.append(content11)
        let content12 = try! ARModels.loadScene12()
        arView.scene.anchors.append(content12)
        
        // extras:
//        let content13 = try! ARModels.loadScene13()
//        arView.scene.anchors.append(content13)
//        let content14 = try! ARModels.loadScene14()
//        arView.scene.anchors.append(content14)
//        let content15 = try! ARModels.loadScene15()
//        arView.scene.anchors.append(content15)
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
        // currentName format is like: reality:ARModels.reality/assets/QR code 1_6f326651.png
        
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

