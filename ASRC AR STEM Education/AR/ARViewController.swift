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
//        let configuration = ARWorldTrackingConfiguration()
        
        let content = try! TestingSPHERE.loadSphere()
        arView.scene.anchors.append(content)
        
        let content2 = try! TestingSPHERE.loadShape()
        arView.scene.anchors.append(content2)
        
//        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)!
//        configuration.detectionImages = referenceImages
//        arView.session.run(configuration)
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for i in 0...(anchors.count-1) {
            guard let imageAnchor = anchors[i] as? ARImageAnchor else { return }
            let refImage = imageAnchor.referenceImage
            self.currentName = refImage.name!
            

        }
    }
    
//    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
//        for imageAnchor in anchors {
//            if imageAnchor is ARImageAnchor {
//            let refImageAnchor = AnchorEntity(anchor: imageAnchor)
//            let imageName = imageAnchor.name
//            if imageName  == "QR code 1" {
//                let content = try! TestingSPHERE.loadSphere()
//                print(content) // content does load????????????
//                arView.scene.anchors.append(content)
//                arView.scene.addAnchor(content)
//
//                refImageAnchor.addChild(content)
//                arView.scene.addAnchor(refImageAnchor)
//
//                print("image recognized")
//
//                // collectionViewController!.unlockItem(imageAnchor.name!)
//            } else {
//                print("wrong image")
//            }
//            else if imageName == "QR code 2" {
//                // TODO:
//            } else if imageName == "QR code 3" {
//                // TODO:
//            } else if imageName == "QR code 4" {
//                // TODO:
//            } else if imageName == "QR code 5" {
//                // TODO:
//            } else if imageName == "QR code 6" {
//                // TODO:
//            } else if imageName == "QR code 7" {
//                // TODO:
//            } else if imageName == "QR code 8" {
//                // TODO:
//            } else if imageName == "QR code 9" {
//                // TODO:
//            } else if imageName == "QR code 10" {
//                // TODO:
//            }
//            }
//        }
//    }

//    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
//        guard let imageAnchor = anchors[0] as? ARImageAnchor else { return }
//        // Assuming only one reference image. A for-in loop could work for more targets
//        print("did update")
//        for imageAnchor in anchors {
//            var imageName = imageAnchor.name
//            if imageName == "QR code 1" {
//                currentName = imageName
//            }
//        }
//    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // currentName format is like: reality:TestingSPHERE.reality/assets/QR code 1_6f326651.png
        
        // Remove the underscore and everything after
        var underscoreIndex = self.currentName.firstIndex(of: "_")
        var fileName = self.currentName[..<underscoreIndex!]
        
        // Remove everthing up to the second slash
        var qrIndex = self.currentName.firstIndex(of: "Q")
        fileName = fileName[qrIndex!...]
        
        print(fileName)
        
        if sender.tag == 0 {
            collectionViewController!.unlockItem(String(fileName))
        }
    }
    
}

