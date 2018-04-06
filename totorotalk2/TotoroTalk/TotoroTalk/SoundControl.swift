//
//  SoundControl.swift
//  TotoroTalk
//
//  Created by Li Shuzu on 7/07/17.
//  Copyright © 2017 TimePic. All rights reserved.
//

import UIKit

class SoundControl: UIStackView {
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        super.init(coder:coder)
        setup()
    }

    
    //MARK: Private Methods
    
    private func setup(){
        let button = UIButton()
        button.backgroundColor = UIColor.red;

         addArrangedSubview(button)
        let soundLabel = UILabel()
        soundLabel.text = "Wake Up"
        soundLabel.textAlignment = .center
        addArrangedSubview(soundLabel)

        
    }

}
