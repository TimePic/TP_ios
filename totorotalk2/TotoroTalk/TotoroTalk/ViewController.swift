//
//  ViewController.swift
//  TotoroTalk
//
//  Created by Li Shuzu on 7/07/17.
//  Copyright © 2017 TimePic. All rights reserved.
//

import UIKit

@IBDesignable class ViewController: UIViewController {

    //MARK: Properties
    
    
    @IBOutlet weak var call_partner: TPSOundButton!
    @IBOutlet weak var contact: TPSOundButton!
    @IBOutlet weak var defence: TPSOundButton!
    @IBOutlet weak var dont_hurt_me: TPSOundButton!
    
    @IBOutlet weak var feed_or_pet_borderView: UIView!
    
    
    @IBOutlet weak var feed_or_pet: TPSOundButton!
    @IBOutlet weak var lone: TPSOundButton!
    @IBOutlet weak var marriage_despute: TPSOundButton!
    @IBOutlet weak var answer_bb: TPSOundButton!
    
    
    

    
    @IBOutlet weak var bb_happy: TPSOundButton!
    @IBOutlet weak var bb_ask_care_food: TPSOundButton!
    @IBOutlet weak var bb_sleepy: TPSOundButton!
    @IBOutlet weak var bb_wakeup: TPSOundButton!
    
    @IBOutlet weak var protest: TPSOundButton!
    @IBOutlet weak var warning: TPSOundButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUIButtons();

    }
    
    //MARK: Actions
    
    @objc func playSoundByButton(_ sender: UIButton) {
        
//        playSound(sender.tag)
    }
    
    

    
    
    
    
    

    
    func initUIButtons(){

        call_partner.tag = BaseConstants.tags.UIButton_call_partner;
        call_partner.setUILabelText("Call Partner")
        
        contact.tag = BaseConstants.tags.UIButton_contact;
        contact.setUILabelText("Contact")
        
        defence.tag = BaseConstants.tags.UIButton_defence;
        defence.setUILabelText("Defence")
        
        
        dont_hurt_me.tag = BaseConstants.tags.UIButton_dont_hurt_me;
        dont_hurt_me.setUILabelText("Don't Hurt Me")
        
        feed_or_pet.tag = BaseConstants.tags.UIButton_feed_or_pet;
        feed_or_pet.setUILabelText("Ask Feed or Pet")
        
        feed_or_pet_borderView.layer.borderWidth = 1.0;
        feed_or_pet_borderView.layer.borderColor = UIColor.lightGray.cgColor;
        
        feed_or_pet_borderView.layer.cornerRadius = 0.5 * feed_or_pet_borderView.bounds.size.width
        feed_or_pet_borderView.clipsToBounds = true
        
        feed_or_pet_borderView.layer.cornerRadius = 10.0;
        
        
        
        lone.tag = BaseConstants.tags.UIButton_lone;
        lone.setUILabelText("Lone")
        
        marriage_despute.tag = BaseConstants.tags.UIButton_marriage_despute;
        marriage_despute.setUILabelText("Marriage Despute")
        
        answer_bb.tag = BaseConstants.tags.UIButton_answer_bb
        answer_bb.setUILabelText("Respond Babies")

        bb_happy.tag = BaseConstants.tags.UIButton_bb_happy;
        bb_happy.setUILabelText("Baby Happy")

        bb_ask_care_food.tag = BaseConstants.tags.UIButton_bb_ask_care_food;
        bb_ask_care_food.setUILabelText("Baby Ask care or food")
        
        bb_wakeup.tag = BaseConstants.tags.UIButton_bb_wakeup;
        bb_wakeup.setUILabelText("Baby Wake Up")
        
        bb_sleepy.tag = BaseConstants.tags.UIButton_bb_sleepy;
        bb_sleepy.setUILabelText("Baby Sleepy")
        
        protest.tag = BaseConstants.tags.UIButton_protest;
        protest.setUILabelText("Protest")

        warning.tag = BaseConstants.tags.UIButton_warning;
        warning.setUILabelText("Warning")
        
    }
}

