//
//  DetailViewController.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/15/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var trackName: UILabel!
    @IBOutlet var contentAdvisoryRating: UILabel!
    @IBOutlet var trackPrice: UILabel!
    @IBOutlet var longDescription: UITextView!
    
    var movieTitle: String?
    var advisoryRating: String?
    var price: Double?
    var movieDescription: String?
    var previewUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trackName.text = movieTitle
        contentAdvisoryRating.text = advisoryRating
        trackPrice.text = "$\(String(describing: price!))"
        longDescription.text = movieDescription
    }
    
    @IBAction func openMoviePreviewUrl(_ sender: UIButton) {
    }
}
