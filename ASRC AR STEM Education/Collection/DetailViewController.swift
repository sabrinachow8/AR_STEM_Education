//
//  DetailViewController.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/15/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemPicture: UIImageView!
    @IBOutlet var longDescription: UITextView!
    
    var itemTitle: String?
    var itemPicName: String?
    var itemDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemName.text = itemTitle
        itemPicture.image = UIImage(named: itemPicName!)
        longDescription.text = itemDescription
    }
    
}
