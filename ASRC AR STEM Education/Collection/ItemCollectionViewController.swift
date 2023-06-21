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
    
    @IBOutlet var collectionView1: UICollectionView!
    @IBOutlet var collectionView2: UICollectionView!
    @IBOutlet var collectionView3: UICollectionView!
    let collectionView1Identifier = "CollectionView1Cell"
    let collectionView2Identifier = "CollectionView2Cell"
    let collectionView3Identifier = "CollectionView3Cell"
    
    
    // MARK: UICollectionView data
    
    private var itemSet1: [Item] = [
        Item(name: "model 1", pictureName: "model 1", description: "desc for model 1"),
        Item(name: "model 2", pictureName: "model 2", description: "desc for model 2"),
        Item(name: "model 3", pictureName: "model 3", description: "desc for model 3"),
        Item(name: "model 4", pictureName: "model 4", description: "desc for model 4"),
        Item(name: "model 5", pictureName: "model 5", description: "desc for model 5")
    ]
    private var itemSet2: [Item] = [
        Item(name: "model 6", pictureName: "model 6", description: "desc for model 6"),
        Item(name: "model 7", pictureName: "model 7", description: "desc for model 7"),
        Item(name: "model 8", pictureName: "model 8", description: "desc for model 8"),
        Item(name: "model 9", pictureName: "model 9", description: "desc for model 9"),
        Item(name: "model 10", pictureName: "model 10", description: "desc for model 10")
    ]
    private var itemSet3: [Item] = [
        Item(name: "model 11", pictureName: "model 11", description: "desc for model 11"),
        Item(name: "model 12", pictureName: "model 12", description: "desc for model 12"),
        Item(name: "model 13", pictureName: "model 13", description: "desc for model 13"),
        Item(name: "model 14", pictureName: "model 14", description: "desc for model 14"),
        Item(name: "model 15", pictureName: "model 15", description: "desc for model 15")
    ]
    
    
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
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // all of the cell classes are exactly the same-- i just couldn't find any better way to do this
        if collectionView == self.collectionView1 {
            let cell1 = collectionView1.dequeueReusableCell(withReuseIdentifier: "itemCell1", for: indexPath) as! ItemCellView1
            cell1.itemImage.image = UIImage(named: itemSet1[indexPath.row].pictureName)
            return cell1
        } else if collectionView == self.collectionView2 {
            let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: "itemCell2", for: indexPath) as! ItemCellView2
            cell2.itemImage.image = UIImage(named: itemSet2[indexPath.row].pictureName)
            return cell2
        } else {
            let cell3 = collectionView3.dequeueReusableCell(withReuseIdentifier: "itemCell3", for: indexPath) as! ItemCellView3
            cell3.itemImage.image = UIImage(named: itemSet3[indexPath.row].pictureName)
            return cell3
        }

    }
    
    
    // MARK: - See detail of item
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView1 {
            let currentItem = itemSet1[indexPath.row]
            performSegue(withIdentifier: "showItemDetails", sender: currentItem)
        } else if collectionView == collectionView2 {
            let currentItem = itemSet2[indexPath.row]
            performSegue(withIdentifier: "showItemDetails", sender: currentItem)
        } else {
            let currentItem = itemSet3[indexPath.row]
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
    
}
