//
//  functions.swift
//  TotoroTalk
//
//  Created by Li Shuzu on 6/04/18.
//  Copyright © 2018 TimePic. All rights reserved.
//

import Foundation
import UIKit
import os.log

struct BaseConstants {
    struct tags {
        static let  UIButton_call_partner = 1
        static let  UIButton_contact = 2
        static let  UIButton_defence = 3
        static let  UIButton_dont_hurt_me = 4
        static let  UIButton_feed_or_pet = 5
        static let  UIButton_lone = 6
        static let  UIButton_marriage_despute = 7
        static let  UIButton_answer_bb = 8
        static let  UIButton_bb_happy = 9
        static let  UIButton_bb_ask_care_food = 10
        static let  UIButton_bb_wakeup = 11
        static let  UIButton_bb_sleepy = 12
        static let  UIButton_protest = 13
        static let  UIButton_warning = 14

    }
    
    struct global{
        static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        static let SoundsArchiveURL = DocumentsDirectory.appendingPathComponent("sounds")
        static let AppId = "id516541985"
    }
    
}
