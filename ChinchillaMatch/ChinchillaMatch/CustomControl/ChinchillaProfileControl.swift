//
//  ChinchillaProfileView.swift
//  ChinchillaMatch
//
//  Created by Li Shuzu on 18/04/18.
//  Copyright © 2018 TornadoLab. All rights reserved.
//

import UIKit

@IBDesignable  class ChinchillaProfileControl: UIView {
    
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
        super.init(coder: coder)!
        setUpViews()
    }
    
    func setUpViews(){
        let margins = self.layoutMarginsGuide
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabelView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        nameLabelView.textColor = UIColor.white
        var frame = self.frame
        let canvasView = UIView(frame: frame)
        print("setUpViews: Frame: \(self.frame.origin)")
        canvasView.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            (photoImageView.leadingAnchor.constraint(equalTo: canvasView.leadingAnchor)),
            (photoImageView.trailingAnchor.constraint(equalTo: canvasView.trailingAnchor)),
            (photoImageView.topAnchor.constraint(equalTo: canvasView.topAnchor)),
            (photoImageView.bottomAnchor.constraint(equalTo: canvasView.bottomAnchor))
            ])
        
        addSubview(canvasView)
        addSubview(nameLabelView)
        
        canvasView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true;
        canvasView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true;
        canvasView.bottomAnchor.constraint(equalTo: nameLabelView.topAnchor).isActive = true;

        
        nameLabelView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -50).isActive = true
        
        nameLabelView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
    }
    func updateUI(){
        photoImageView.image = self.chinModel.photo
        nameLabelView.text = self.chinModel.name
    }
    
    
    

}
