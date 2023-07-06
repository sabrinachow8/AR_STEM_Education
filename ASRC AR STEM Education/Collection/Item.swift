//
//  Item.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/21/23.
//

import Foundation
import SwiftUI

class Item {
    var name: String = ""
    var refImage: String = ""
    var pictureName: String = ""
    var description: String = ""
    var isEnabled = false
    
    init(name: String, refImageName: String, pictureName: String, description: String, isEnabled: Bool){
        self.pictureName = pictureName
        self.refImage = refImageName
        self.name = name
        self.description = description
        self.isEnabled = isEnabled
    }
}

