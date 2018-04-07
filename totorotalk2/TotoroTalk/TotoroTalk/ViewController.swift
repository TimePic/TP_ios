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
    var borderViews = [UIView]()
    
    
    @IBOutlet weak var call_partner: TPSOundButton!
    @IBOutlet weak var contact: TPSOundButton!
    @IBOutlet weak var defence: TPSOundButton!
    @IBOutlet weak var dont_hurt_me: TPSOundButton!
    
    
    
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
    
    
    //Mark: BorderViews
    @IBOutlet weak var call_partner_borderView: UIView!
    @IBOutlet weak var contact_borderView: UIView!
    @IBOutlet weak var defence_borderView: UIView!
    @IBOutlet weak var dont_hurt_me_borderView: UIView!
    
    @IBOutlet weak var feed_or_pet_borderView: UIView!
    @IBOutlet weak var lone_borderView: UIView!
    @IBOutlet weak var marriage_depute_borderView: UIView!
    @IBOutlet weak var answer_bb_borderView: UIView!
    
    @IBOutlet weak var bb_happy_borderView: UIView!
    @IBOutlet weak var bb_ask_care_food_borderView: UIView!
    @IBOutlet weak var bb_sleepy_borderView: UIView!
    @IBOutlet weak var bb_wakeup_borderView: UIView!
    
    @IBOutlet weak var protest_borderView: UIView!
    @IBOutlet weak var warning_borderView: UIView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUIButtons();
        initBorders();

    }
    
    //MARK: Actions
    
    @objc func playSoundByButton(_ sender: UIButton) {
        
//        playSound(sender.tag)
    }
    
    

    
    
    
    
    func initBorders() {
        borderViews.append(call_partner_borderView)
        borderViews.append(contact_borderView)
        borderViews.append(defence_borderView)
        borderViews.append(dont_hurt_me_borderView)
        
        borderViews.append(feed_or_pet_borderView)
        borderViews.append(lone_borderView)
        borderViews.append(marriage_depute_borderView)
        borderViews.append(answer_bb_borderView)
        
        borderViews.append(bb_happy_borderView)
        borderViews.append(bb_ask_care_food_borderView)
        borderViews.append(bb_sleepy_borderView)
        borderViews.append(bb_wakeup_borderView)
        
        borderViews.append(protest_borderView)
        borderViews.append(warning_borderView)
        
        for borderView in borderViews {
            borderView.layer.borderWidth = 1.0;
            borderView.layer.borderColor = UIColor.lightGray.cgColor;
    
            borderView.layer.cornerRadius = 0.5 * borderView.bounds.size.width
            borderView.clipsToBounds = true
    
            borderView.layer.cornerRadius = 10.0;
            
        }
        
    }

    
    func initUIButtons(){

        call_partner.tag = BaseConstants.tags.UIButton_call_partner;
        call_partner.setUILabelText("Call Partner".localized)
        
        contact.tag = BaseConstants.tags.UIButton_contact;
        contact.setUILabelText("Contact".localized)
        
        defence.tag = BaseConstants.tags.UIButton_defence;
        defence.setUILabelText("Defence".localized)
        
        
        dont_hurt_me.tag = BaseConstants.tags.UIButton_dont_hurt_me;
        dont_hurt_me.setUILabelText("Don't Hurt Me".localized)
        
        feed_or_pet.tag = BaseConstants.tags.UIButton_feed_or_pet;
        feed_or_pet.setUILabelText("Ask Feed or Pet".localized)

        lone.tag = BaseConstants.tags.UIButton_lone;
        lone.setUILabelText("Lone".localized)
        
        marriage_despute.tag = BaseConstants.tags.UIButton_marriage_despute;
        marriage_despute.setUILabelText("Marriage Despute".localized)
        
        answer_bb.tag = BaseConstants.tags.UIButton_answer_bb
        answer_bb.setUILabelText("Respond Own Baby".localized)

        bb_happy.tag = BaseConstants.tags.UIButton_bb_happy;
        bb_happy.setUILabelText("Baby Happy".localized)

        bb_ask_care_food.tag = BaseConstants.tags.UIButton_bb_ask_care_food;
        bb_ask_care_food.setUILabelText("Baby Ask care or food".localized)
        
        bb_wakeup.tag = BaseConstants.tags.UIButton_bb_wakeup;
        bb_wakeup.setUILabelText("Baby Wake Up".localized)
        
        bb_sleepy.tag = BaseConstants.tags.UIButton_bb_sleepy;
        bb_sleepy.setUILabelText("Baby Sleepy".localized)
        
        protest.tag = BaseConstants.tags.UIButton_protest;
        protest.setUILabelText("Protest".localized)

        warning.tag = BaseConstants.tags.UIButton_warning;
        warning.setUILabelText("Warning".localized)
        
    }
}

