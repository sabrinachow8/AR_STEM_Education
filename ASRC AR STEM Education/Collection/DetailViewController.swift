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
        longDescription.text = itemDescription
        
        // Formatting the image
        itemPicture.image = UIImage(named: itemPicName!)
        itemPicture.layer.borderWidth = 3
        itemPicture.layer.borderColor = UIColor(red: 59/255, green: 86/255, blue: 160/255, alpha: 1).cgColor
        itemPicture.layer.cornerRadius = 10
    }
    
}
