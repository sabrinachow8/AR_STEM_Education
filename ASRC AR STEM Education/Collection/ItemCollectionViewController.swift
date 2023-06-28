//
//  ItemCollectionViewController.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/20/23.
//

import Foundation
import UIKit

private let reuseIdentifier = "itemCell"

class ItemCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var remainingLabel: UILabel!
    
    @IBOutlet var collectionView1: UICollectionView!
    @IBOutlet var collectionView2: UICollectionView!
    @IBOutlet var collectionView3: UICollectionView!
    let collectionView1Identifier = "CollectionView1Cell"
    let collectionView2Identifier = "CollectionView2Cell"
    let collectionView3Identifier = "CollectionView3Cell"
    
    var disableAll = false
    
    
    // MARK: Collection data
    
    // All items
    var model1 = Item(name: "model 1", pictureName: "model 1", description: "desc for model 1", isEnabled: true)
    var model2 = Item(name: "model 2", pictureName: "model 2", description: "desc for model 2", isEnabled: false)
    var model3 = Item(name: "model 3", pictureName: "model 3", description: "desc for model 3", isEnabled: false)
    var model4 = Item(name: "model 4", pictureName: "model 4", description: "desc for model 4", isEnabled: false)
    var model5 = Item(name: "model 5", pictureName: "model 5", description: "desc for model 5", isEnabled: false)
    var model6 = Item(name: "model 6", pictureName: "model 6", description: "desc for model 6", isEnabled: false)
    var model7 = Item(name: "model 7", pictureName: "model 7", description: "desc for model 7", isEnabled: false)
    var model8 = Item(name: "model 8", pictureName: "model 8", description: "desc for model 8", isEnabled: false)
    var model9 = Item(name: "model 9", pictureName: "model 9", description: "desc for model 9", isEnabled: false)
    var model10 = Item(name: "model 10", pictureName: "model 10", description: "desc for model 10", isEnabled: false)
    var model11 = Item(name: "model 11", pictureName: "model 11", description: "desc for model 11", isEnabled: false)
    var model12 = Item(name: "model 12", pictureName: "model 12", description: "desc for model 12", isEnabled: false)
    var model13 = Item(name: "model 13", pictureName: "model 13", description: "desc for model 13", isEnabled: false)
    var model14 = Item(name: "model 14", pictureName: "model 14", description: "desc for model 14", isEnabled: false)
    var model15 = Item(name: "model 15", pictureName: "model 15", description: "desc for model 15", isEnabled: false)
    
    // Groups of items
    var itemSet1 = [Item]()
    var itemSet2 = [Item]()
    var itemSet3 = [Item]()
    var itemSetAll = [Item]()
    
    
    // MARK: Setting up the collection view
    
    override func viewDidLoad() {
        collectionView1.delegate = self
        collectionView2.delegate = self
        collectionView3.delegate = self

        collectionView1.dataSource = self
        collectionView2.dataSource = self
        collectionView3.dataSource = self

        self.view.addSubview(collectionView1)
        self.view.addSubview(collectionView2)
        self.view.addSubview(collectionView3)
        
        // Setting up groups of data
        self.itemSet1 = [model1, model2, model3, model4, model5]
        self.itemSet2 = [model6, model7, model8, model9, model10]
        self.itemSet3 = [model11, model12, model13, model14, model15]
        self.itemSetAll = [model1, model2, model3, model4, model5,
                           model6, model7, model8, model9, model10,
                           model11, model12, model13, model14, model15]
        
        // Changing label text
        var numLeft = 0
        for item in itemSetAll {
            if !item.isEnabled {
                numLeft += 1
            }
        }
        remainingLabel.text = "Remaining: " + String(numLeft) + "/" + String(itemSetAll.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // NOTE: All of the cell classes (1, 2, 3) are exactly the same...
        // I just couldn't find any better way to do this :(
        if collectionView == self.collectionView1 {
            let currentCell = collectionView1.dequeueReusableCell(withReuseIdentifier: "itemCell1", for: indexPath) as! ItemCellView1
            currentCell.itemImage.image = UIImage(named: itemSet1[indexPath.row].pictureName)
            
            // Setting up image border
            currentCell.itemImage.layer.borderWidth = 2
            currentCell.itemImage.layer.borderColor = UIColor(red: 59/255, green: 86/255, blue: 160/255, alpha: 1).cgColor
            currentCell.itemImage.layer.cornerRadius = 5
            
            // Changing image opacity if needed
            if itemSet1[indexPath.row].isEnabled {
                currentCell.itemCover.backgroundColor = UIColor(white: 1, alpha: 0)
            } else {
                currentCell.itemCover.backgroundColor = UIColor(red: 36/255, green: 57/255, blue: 126/255, alpha: 0.5)
            }
            return currentCell
        } else if collectionView == self.collectionView2 {
            let currentCell = collectionView2.dequeueReusableCell(withReuseIdentifier: "itemCell2", for: indexPath) as! ItemCellView2
            currentCell.itemImage.image = UIImage(named: itemSet2[indexPath.row].pictureName)
            currentCell.itemImage.layer.borderWidth = 2
            currentCell.itemImage.layer.borderColor = UIColor(red: 59/255, green: 86/255, blue: 160/255, alpha: 1).cgColor
            currentCell.itemImage.layer.cornerRadius = 5
            if itemSet2[indexPath.row].isEnabled {
                currentCell.itemCover.backgroundColor = UIColor(white: 1, alpha: 0)
            } else {
                currentCell.itemCover.backgroundColor = UIColor(red: 36/255, green: 57/255, blue: 126/255, alpha: 0.5)
            }
            return currentCell
        } else {
            let currentCell = collectionView3.dequeueReusableCell(withReuseIdentifier: "itemCell3", for: indexPath) as! ItemCellView3
            currentCell.itemImage.image = UIImage(named: itemSet3[indexPath.row].pictureName)
            currentCell.itemImage.layer.borderWidth = 2
            currentCell.itemImage.layer.borderColor = UIColor(red: 59/255, green: 86/255, blue: 160/255, alpha: 1).cgColor
            currentCell.itemImage.layer.cornerRadius = 5
            if itemSet3[indexPath.row].isEnabled {
                currentCell.itemCover.backgroundColor = UIColor(white: 1, alpha: 0)
            } else {
                currentCell.itemCover.backgroundColor = UIColor(red: 36/255, green: 57/255, blue: 126/255, alpha: 0.5)
            }
            return currentCell
        }
    }
    
    
    // MARK: - See detail of item
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var currentItem = itemSet3[indexPath.row]
        if collectionView == collectionView1 {
            currentItem = itemSet1[indexPath.row]
        } else if collectionView == collectionView2 {
            currentItem = itemSet2[indexPath.row]
        }
        if currentItem.isEnabled {
            performSegue(withIdentifier: "showItemDetails", sender: currentItem)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showItemDetails" {
            let destination = segue.destination as! DetailViewController
            let specificSender = sender as! Item
            destination.itemTitle = specificSender.name
            destination.itemPicName = specificSender.pictureName
            destination.itemDescription = specificSender.description
        }
    }
    
    
    // MARK: - Adjust collection data
    
    func resetAll() {
        disableAll = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Reset all
        if disableAll {
            for index in 0...(itemSetAll.count - 1) {
                itemSetAll[index].isEnabled = false
            }
            
            // Update CollectionViews
            collectionView1.reloadData()
            collectionView2.reloadData()
            collectionView3.reloadData()
            
            // Changing label text
            var numLeft = 0
            for item in itemSetAll {
                if !item.isEnabled {
                    numLeft += 1
                }
            }
            remainingLabel.text = "Remaining: " + String(numLeft) + "/" + String(itemSetAll.count)
        }
        /*
         else if
         
         */
    }
    
}
