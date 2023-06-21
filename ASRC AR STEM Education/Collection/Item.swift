//
//  Item.swift
//  ASRC AR STEM Education
//
//  Created by Sabrina Chow on 6/21/23.
//

import Foundation

struct Item {
    var name : String = ""
    var pictureName : String = ""
    var description : String = ""
    
    init(name: String, pictureName: String, description: String){
        self.pictureName = pictureName
        self.name = name
        self.description = description
        
    }
}
