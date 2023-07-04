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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewController = (self.tabBarController?.viewControllers?[1] as! ItemCollectionViewController)
        
        arView.session.delegate = self
        let configuration = ARImageTrackingConfiguration()
        
        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)!
        configuration.maximumNumberOfTrackedImages = 1
        configuration.trackingImages = referenceImages
        arView.session.run(configuration)
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for imageAnchor in anchors {
            // Ensure the anchor in the list of added anchors can be downcast to an ARImageAnchor
            guard imageAnchor is ARImageAnchor else { return }
            // If the added anchor is named "target", do something with it
            if let imageName = imageAnchor.name, imageName  == "target" {
                let refImageAnchor = AnchorEntity(anchor: imageAnchor)
                let molAnchor = try! Realitycomposertest1.loadScene()
                refImageAnchor.addChild(molAnchor)
                arView.scene.addAnchor(refImageAnchor)
                
                collectionViewController!.unlockItem(imageAnchor.name!)
            }
        }
    }
        
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        guard let imageAnchor = anchors[0] as? ARImageAnchor else { return }
        // Assuming only one reference image. A for-in loop could work for more targets

        if let imageName = imageAnchor.name, imageName  == "target" {
            // If anything needs to be done as the ref image anchor is updated frame-to-frame, do it here

            // E.g., to check if the reference image is still being tracked:
            // (https://developer.apple.com/documentation/arkit/artrackable/2928210-istracked)
            if imageAnchor.isTracked {
                print("\(imageName) is tracked and has a valid transform")
            } else {
                print("The anchor for \(imageName) is not guaranteed to match the movement of its corresponding real-world feature, even if it remains in the visible scene.")
            }
        }
    }

}

