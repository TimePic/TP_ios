//
//  ChinModel.swift
//  ChinchillaMatch
//
//  Created by Li Shuzu on 17/04/18.
//  Copyright © 2018 TornadoLab. All rights reserved.
//

import UIKit

class ChinModel {
    
    public var name: String
    var photo: UIImage?
    var description: String
    var birthday: Date
    var sex: ChinModel.sexTypes
    var colour: ChinModel.colourTypes
    
    enum sexTypes {
        case male
        case female
        case unkown
    }
    
    enum colourTypes: Int{
        
        case standardGrey
        case heteroBeige
        case homozygousBeige
        case blackVelvet
        case white
        case pinkWhite
        case extraDarkEbony
        case heteroEbony
        case tan
        case Violet
        case solidViolet
        case BeigeViolet
    }
    
    init() {
        self.name = ""
        self.photo = nil
        self.description = ""
        self.birthday = Date()
        self.sex = sexTypes.unkown
        self.colour = colourTypes.BeigeViolet
    }
    
    init(name: String, photo: UIImage?, description: String, birthday: Date, sex: ChinModel.sexTypes, colour: ChinModel.colourTypes) {
        self.name = name
        self.photo = photo
        self.description = description
        self.birthday = birthday
        self.sex = sex
        self.colour = colour
    }
    
    
}
