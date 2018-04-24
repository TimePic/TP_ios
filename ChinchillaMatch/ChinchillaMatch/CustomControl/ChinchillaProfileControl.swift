//
//  ChinchillaProfileView.swift
//  ChinchillaMatch
//
//  Created by Li Shuzu on 18/04/18.
//  Copyright © 2018 TornadoLab. All rights reserved.
//

import UIKit

@IBDesignable  class ChinchillaProfileControl: UIStackView {
    
    var photoImageView = UIImageView();
    var nameLabelView = UILabel();
    var chinModel = ChinModel() {
        didSet {
            updateUI()
        }
    };
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    func setUpViews(){
        
        self.axis = .vertical
        self.distribution = .equalSpacing
        self.alignment = .center
        self.spacing = 8;
        
        
        let mLayout = self.layoutMarginsGuide
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabelView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
//        nameLabelView.textColor = UIColor.white
        
        frame = self.frame
        let canvasView = UIView(frame: frame)
        canvasView.addSubview(photoImageView)
        canvasView.restorationIdentifier = "Profile Image"
        
        NSLayoutConstraint.activate([
            (photoImageView.leadingAnchor.constraint(equalTo: canvasView.leadingAnchor)),
            (photoImageView.trailingAnchor.constraint(equalTo: canvasView.trailingAnchor)),
            (photoImageView.topAnchor.constraint(equalTo: canvasView.topAnchor)),
            (photoImageView.bottomAnchor.constraint(equalTo: canvasView.bottomAnchor))
            ])

        
        addSubview(canvasView)
        addSubview(nameLabelView)

        nameLabelView.bottomAnchor.constraint(equalTo: mLayout.bottomAnchor, constant: 10).isActive = true
        
        nameLabelView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
    }
    func updateUI(){
        photoImageView.image = self.chinModel.photo
        nameLabelView.text = self.chinModel.name
    }
    
    
    

}
