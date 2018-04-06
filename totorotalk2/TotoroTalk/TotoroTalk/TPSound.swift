//
//  Sound.swift
//  TotoroTalk
//
//  Created by Li Shuzu on 8/07/17.
//  Copyright © 2017 TimePic. All rights reserved.
//

import UIKit
import os.log

class TPSound{
    
    //MARK: Types
    struct PropertyKey {
        static let identifier = "identifier"
        static let description = ""
        static let file = ""
        static let audio = "audio"
        static let image = "image"

    }
    
    
    //MARK: Archiving Paths

    
    //MARK Properties
    var identifier:Int = 0
    var description:String = ""
    var file:String = ""
    var audio: NSDataAsset?
    var image: UIImage? = nil
    
    init?(identifier: Int, description: String, file: String, image: UIImage?) {
        
        guard identifier > 0 else{
            return nil
        }
        
        let asset = NSDataAsset(name:"sounds/\(file)")
        self.identifier = identifier
        self.description = description
        self.file = file
        self.image = image
        self.audio = asset
    }
    
    func getUrl() -> String{
        return "\(BaseConstants.global.SoundsArchiveURL)\(self.file)"
    }
    
    
    
    
}
