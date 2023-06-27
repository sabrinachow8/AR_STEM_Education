//
//  ViewController.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/14/23.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        // Reset button has tag of 0
        // Survey button has tag of 1
        if sender.tag == 0 {
            // TODO: reset progress
        } else {
            UIApplication.shared.open(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSc0uAAqjQtLcvcPv5Oa1A7vv6Oke-3xtzJ-65q6GmsTZopm1g/viewform?usp=sf_link")!)
        }
        
    }
    
}

