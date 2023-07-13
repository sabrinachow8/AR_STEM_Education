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
    
    
    // MARK: Collection data
    
    var itemSetAll = [Item]()
    
    // Protein structure:
    var itemSet1 = [Item]()
    var primary = Item(name: "Primary Structure", refImageName: "QR code 1", pictureName: "103d_IMAGE - DNA", description: "   The primary structure of a protein is its most basic structure: a chain. A protein is made up of small blocks called amino acids. One chain of amino acids is called a polypeptide. The amino acids combine in varying numbers and patterns to make up different proteins. Given that there are 20 different kinds of these amino acids, there are a lot of possible combinations. This wide variety of proteins is what supports life! \n   Pictured here is a DNA molecule. The code for an amino acid sequence comes from the DNA.", isEnabled: false)
    var secondaryAlpha = Item(name: "Secondary Structure (A)", refImageName: "QR code 2", pictureName: "1zx3_IMAGE - alpha helix", description: "   Secondary structure can be thought of as the ‘local’ structure of the protein. Parts of the protein fold due to interactions between the atoms of the protein’s backbone, i.e. the continuous chain throughout the protein and not the branches. These folds occur because of hydrogen bonding. These repeat many times throughout the whole amino acid chain. \n   This is an alpha helix, one of the most common secondary structure shapes. As the name suggests, it forms a spiral. In protein models, they are typically represented as cartoon coils. Pictured in this model are three different alpha helices.", isEnabled: false)
    var secondaryBeta = Item(name: "Secondary Structure (B)", refImageName: "QR code 3", pictureName: "4r8o_IMAGE - beta sheet", description: "   Secondary structure can be thought of as the ‘local’ structure of the protein. Parts of the protein fold due to interactions between the atoms of the protein’s backbone, i.e. the continuous chain throughout the protein and not the branches. These folds occur because of hydrogen bonding. These repeat many times throughout the whole amino acid chain. \n   This is a beta sheet, one of the most common secondary structure shapes. The sheet consists of multiple beta strands connected in the sides with hydrogen bonding. The shape of the actual molecule is pleated, but 3D models tend to depict them as mostly flat arrows. The tip of the arrow points towards the end of that part of the protein (known as the C terminus).", isEnabled: false)
    var tertiary = Item(name: "Tertiary Structure", refImageName: "QR code 4", pictureName: "1s1y_IMAGE - tertiary structure", description: "   Tertiary structure builds up from the secondary structure. It is the overall 3D structure of the polypeptide. Intramolecular forces (meaning chemical bonds between the atoms of the protein) drive this level, particularly those between the branches of the amino acid chain.", isEnabled: false)
    var quaternary = Item(name: "Quaternary Structure", refImageName: "QR code 5", pictureName: "4iwm_IMAGE - quaternary structure", description: "   Some proteins are made up of more than one polypeptide! Quaternary structure is when multiple polypeptide subunits come together to form one large, complex protein. In the picture, you can see that there are multiple polypeptides, each represented with a different color. The individual polypeptides have their own alpha helices and beta sheets (secondary structure), and they fold in on themselves (tertiary structure).", isEnabled: false)
    
    // Crystallization:
    var itemSet2 = [Item]()
    var crystals = Item(name: "Crystals", refImageName: "QR code 6", pictureName: "crystals IMAGE", description: "   A crystal is defined as a solid that forms with a repeating pattern of atoms, ions, molecules, etc.\n   With macromolecules, it all begins with identifying a gene of interest. The gene is then expressed many times and purified. Next, the crystals need to be grown. This process is known as crystallization screening. There are many factors that go into whether a crystal can be grown, including both chemical and physical properties. The question is: what are the best conditions for the crystals of this particular protein to grow? The researcher begins with trying some initial conditions. If they get lucky, crystals will grow. Once the crystals begin to show up, the process is optimized by adjusting the different variables to get more and larger crystals. Robots are used to help partially automate the process.", isEnabled: false)
    var reciprocalLattice = Item(name: "Reciprocal Lattice", refImageName: "QR code 7", pictureName: "reciprocal lattice IMAGE", description: "   The next step in the crystallization of the molecule is shooting x-rays at the crystal to get data about the molecule’s shape. X-rays are used because they have one of the shortest wavelengths. Diffraction occurs when light hits a slit or an edge. Diffraction from a single molecule is very difficult to detect. But if the molecule repeats many times, such as in a crystal, the signal is amplified. When the x-rays hit the crystal, they scatter from the electrons of the molecule’s atoms. A detector is set up opposite of the x-ray source to pick up where the x-rays are shifted to.\n   The image shown is an example of what the output looks like. This is called the reciprocal lattice. At this stage, this clearly looks nothing like a molecule. However, each dot represents an atom and contains valuable information about the overall structure.", isEnabled: false)
    var phaseProblem = Item(name: "The 'Phase Problem'", refImageName: "QR code 8", pictureName: "phases IMAGE", description: "   Electron density is related to the dots of the reciprocal lattice. This is represented as a mathematical equation known as a Fourier transform. Each spot is considered as a single wave of all the X-rays scattered in that direction.\n   Waves have three different factors: amplitude, frequency, and phase. Light detectors can only identify the amplitude. This is an issue though because the phase is also essential for finding the electron density. To find the phases, additional experiments are required. Alternatively, previously determined models can be used to estimate the phase if related to the new model.", isEnabled: false)
    var electronDensityMap = Item(name: "Electron Density", refImageName: "QR code 9", pictureName: "density map IMAGE", description: "   The final model is the interpretation of the electron density. Since the protein crystal was built from a gene of interest, the amino acid sequence is known in advance. The next step is fitting this sequence into the electron density map. In the image, the thin mesh represents the electron density and the thicker sticks make up the model.\n   This section is where statistics comes into play. The atomic model needs to provide a statistically reasonable explanation of the experimental data. The key number is the R-factor, a measure of how well the model matches the observed x-ray measurements.", isEnabled: false)
    
    // ASRC:
    var itemSet3 = [Item]()
    var etaIsiorho = Item(name: "6VNA - Eta Isiorho", refImageName: "QR code 10", pictureName: "6vna_IMAGE - eta", description: "   The molecule pictured here is a homolog of heme oxygenases. Homolog means that this is a molecule with a similar structure to the heme oxygenases. So then what is a ‘heme oxygenase’? It is a kind of protein, specifically an enzyme. It breaks down heme (related to hemoglobin), releasing iron. Heme oxygenases are therefore important because they make it possible to reclaim iron, making it available to be used in other processes of life.\n   This model was provided by Eta Isiorho. Isiorho leads the Macromolecular Crystallization Facility at the ASRC. Her role focuses on using X-rays to crystallize, i.e. give shape to, larger molecules, such as proteins. With her expertise, Isiorho supports researchers outside and within the CUNY system who need access to crystallization services.", isEnabled: false)
    var amedeeDesGeorges = Item(name: "6M1D - Amédée des Georges", refImageName: "QR code 11", pictureName: "6m1d_IMAGE", description: "   This molecule is the structure of ACE2, an enzyme. This particular enzyme is relevant because it is a receptor on cell surfaces for SARS-CoV-2, aka COVID. Since ACE2 allows COVID to enter the cells, inhibiting ACE2 leads to inhibiting COVID.\n   This model was used in the research of Amédée des Georges. He is an Assistant Professor of Chemistry and Biochemistry at the City College of New York and an Assistant Professor in the SBI initiative at the ASRC. His speciality is single-particle cryo-electron microscopy. This field of work uses electrons to magnify the images of macromolecules. His research group works on regulatory mechanisms of large protein/RNA complexes.", isEnabled: false)
    var danielKeedy = Item(name: "6B90 - Daniel Keedy", refImageName: "QR code 12", pictureName: "6b90_IMAGE", description: "   Allosteric regulation is a part of regulating enzyme binding. This particular method involves another molecule binding to a spot on the enzyme other than its traditional binding site. The pictured molecule is protein tyrosine phosphatase 1B with an allosteric site. In this study, Daniel Keedy identified many other allosteric sites for this protein, supporting further research on control over protein function.\n   Keedy studies protein conformations. He is an Assistant Professor of Chemistry and Biochemistry at the City College of New York and an Assistant Professor in the SBI initiative. Since structure determines function, his lab also looks at how these shifts affect the protein’s dynamic functions. His work relates to medicine (finding drug targets) as well as evolutionary processes that led to functional diversity.", isEnabled: false)
    
    
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
        self.itemSet1 = [primary, secondaryAlpha, secondaryBeta, tertiary, quaternary]
        self.itemSet2 = [crystals, reciprocalLattice, phaseProblem, electronDensityMap]
        self.itemSet3 = [etaIsiorho, amedeeDesGeorges, danielKeedy]
        self.itemSetAll = [primary, secondaryAlpha, secondaryBeta, tertiary, quaternary,
                           crystals, reciprocalLattice, phaseProblem, electronDensityMap,
                           etaIsiorho, amedeeDesGeorges, danielKeedy]
        
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
        if collectionView == self.collectionView1 {
            return 5
        } else if collectionView == self.collectionView2 {
            return 4
        } else {
            return 3
        }
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
                currentCell.itemCover.backgroundColor = UIColor(red: 36/255, green: 57/255, blue: 126/255, alpha: 0.6)
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
                currentCell.itemCover.backgroundColor = UIColor(red: 36/255, green: 57/255, blue: 126/255, alpha: 0.6)
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
                currentCell.itemCover.backgroundColor = UIColor(red: 36/255, green: 57/255, blue: 126/255, alpha: 0.6)
            }
            return currentCell
        }
    }
    
    
    // MARK: - See detail of item (via segue)
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var currentItem = itemSet1[indexPath.row]
        if collectionView == collectionView2 {
            currentItem = itemSet2[indexPath.row]
        } else if collectionView == collectionView3 {
            currentItem = itemSet3[indexPath.row]
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
    
    func updateData() {
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
    
    func resetAll() {
        for index in 0...(itemSetAll.count - 1) {
            itemSetAll[index].isEnabled = false
        }
        updateData()
    }
    
    func unlockItem(_ itemName: String) {
        for index in 0...(itemSetAll.count - 1) {
            if itemSetAll[index].refImage == itemName {
                itemSetAll[index].isEnabled = true
            }
        }
        updateData()
    }
    
}
