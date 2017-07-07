//
//  ViewController.swift
//  TotoroTalk
//
//  Created by Li Shuzu on 7/07/17.
//  Copyright © 2017 TimePic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var wakeButton: UIButton!
    @IBOutlet weak var sleepButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func playSound(_ sender: UIButton) {
        
        switch sender {
        case wakeButton:
            print("wakeButton")
        case sleepButton:
            print("sleepButton")
        default:
            print("default")
        }
    }
    

}

