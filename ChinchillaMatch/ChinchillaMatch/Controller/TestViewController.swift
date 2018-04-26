//
//  TestViewController.swift
//  ChinchillaMatch
//
//  Created by Li Shuzu on 25/04/18.
//  Copyright © 2018 TornadoLab. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    // Simply put an UIImageView right under UINavigationBar to see the result
    @IBOutlet weak var imageView: UIImageView!
    
    // We will animate this object instead of the imageView
    // because moving the imageView back and forth between it's super view and window is quite troublesome
    lazy var clonedImageView: UIImageView = {
        var view = self.imageView.deepCopy() as! UIImageView
        let window = UIApplication.shared.keyWindow
        view.isHidden = true
        window?.addSubview(view)
        
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
        imageView.addGestureRecognizer(longPress)
        imageView.isUserInteractionEnabled = true
    }
    
   @objc func longPress(gesture:UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizerState.began {
            print("user pressed on image")
            
            self.showImageViewClone()
            let bounds = clonedImageView.bounds
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                self.clonedImageView.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 50, height: bounds.size.height + 50)
            }, completion: nil)
        }
        else if gesture.state == UIGestureRecognizerState.changed {
            gesture.state == UIGestureRecognizerState.began
        }
        else {
            print("user release on image")
            
            _ = clonedImageView.bounds
            UIView.animate(withDuration: 0.2, animations: {
                self.clonedImageView.bounds = self.imageView.bounds
            }, completion: { _ in
                self.hideImageViewClone()
            })
        }
    }
    
    // This method is to ensure that the cloned imageView will appear exactly at the point you want
    func showImageViewClone() {
        let window = UIApplication.shared.keyWindow
        let origin = imageView.superview!.convert(imageView.frame.origin, to: window)
        
        var frame = clonedImageView.frame
        frame.origin = origin
        clonedImageView.frame = frame
        
        clonedImageView.isHidden = false
        imageView.isHidden = true
    }
    
    func hideImageViewClone() {
        self.imageView.isHidden = false
        self.clonedImageView.isHidden = true
    }
}

extension UIView {
    func deepCopy() -> UIView {
        
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        let copy = NSKeyedUnarchiver.unarchiveObject(with: data)!  as! UIView
        
        return copy
    }
}
