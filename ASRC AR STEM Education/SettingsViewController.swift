//
//  ViewController.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/14/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var collectionViewController: ItemCollectionViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionViewController = (self.tabBarController?.viewControllers?[1] as! ItemCollectionViewController)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        // Reset button has tag of 0
        // Survey button has tag of 1
        if sender.tag == 0 {
            collectionViewController!.resetAll()
        } else {
            UIApplication.shared.open(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSc0uAAqjQtLcvcPv5Oa1A7vv6Oke-3xtzJ-65q6GmsTZopm1g/viewform?usp=sf_link")!)
        }
        
    }
    
}

