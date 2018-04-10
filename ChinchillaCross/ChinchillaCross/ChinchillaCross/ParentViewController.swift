//
//  ViewController.swift
//  ChinchillaCross
//
//  Created by Li Shuzu on 10/04/18.
//  Copyright © 2018 TornadoLab. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    

    //MARK: Properties
    
    @IBOutlet weak var BeigeLabel: UILabel!
    @IBOutlet weak var BeigePickerView: UIPickerView!
    var BeigePickerData = [String]()
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        BeigePickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
        self.BeigePickerView.dataSource = self;
        self.BeigePickerView.delegate = self;
        self.BeigePickerView.isHidden = true
        initLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func initLabels(){
        BeigeLabel.isUserInteractionEnabled = true
        let tapBeige = UITapGestureRecognizer(target: self, action: #selector(ParentViewController.showPicker))
        BeigeLabel.addGestureRecognizer(tapBeige)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return BeigePickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return BeigePickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Select:\(BeigePickerData[row])")
    }
    
    @objc func showPicker(){
        print("Label tapped")
        BeigePickerView.isHidden = false
    }
    
    


}

