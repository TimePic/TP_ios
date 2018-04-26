//
//  ViewController.swift
//  ChinchillaMatch
//
//  Created by Li Shuzu on 16/04/18.
//  Copyright © 2018 TornadoLab. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController{

    // MARK: - Properties
    
    @IBOutlet weak var CurrentProfileUIView: UIView!
     @IBOutlet weak var kolodaView: KolodaView!
    
    let numPages = 6
    var pages = [UIView?]()
    var transitioning = false
    var data = [ChinModel]();
    var screenFrame = CGRect();
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /**
         Setup the initial scroll view content size and first pages only once.
         (Due to this function called each time views are added or removed).
         */
        _ = setupInitialPages
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pages = [UIView?](repeating: nil, count: numPages)
        FakeData()
        
        
        // MARK: - Guestures
//        Swipe Right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    
    lazy var setupInitialPages: Void = {
        /**
         Setup our initial scroll view content size and first pages once.
         
         Layout the scroll view's content size after we have knowledge of the topLayoutGuide dimensions.
         Each page is the width and height of the scroll view's frame.
         
         Note: Set the scroll view's content size to take into account the top layout guide.
         */
        screenFrame = CurrentProfileUIView.frame
        // Pages are created on demand, load the visible page and next page.
        adjustScrollView()
        loadNext()

    }()
    
    // MARK: - Utilities
    
    fileprivate func removeAnyImages() {
        for page in pages where page != nil {
            page?.removeFromSuperview()
        }
    }
    
    /// Readjust the scroll view's content size in case the layout has changed.
    fileprivate func adjustScrollView() {
//        imageScrollView.contentSize =
//            CGSize(width: imageScrollView.frame.width * CGFloat(numPages),
//                   height: imageScrollView.frame.height)
    }
    
    
    // MARK: - Page Loading
    
    fileprivate func loadPage(_ page: Int) {
        print("Load page \(page)")
        guard page < numPages && page != -1 else { return }
        
        if let mChinMode = ChinModel?(data[page]) {
            
            /**
             Setup the canvas view to hold the image.
             Its frame will be the same as the scroll view's frame.
             */
            // Offset the frame's X origin to its correct page offset.
  
            // Set frame's y origin value to take into account the top layout guide.
            screenFrame.origin.y = 0
            let canvasView = ChinchillaProfileControl(frame: screenFrame)
            canvasView.chinModel = mChinMode
            CurrentProfileUIView.addSubview(canvasView)
            pages[page] = canvasView
        }
    }
    
    func loadNext(){
        let ChinId = Int(arc4random_uniform(UInt32(numPages)) + 1)
        guard ChinId < numPages && ChinId != -1 else { return }
        removeAnyImages()
        loadPage(ChinId)
    }
    
     func FakeData(){
        for index in 1...6 {
            let item = ChinModel(name: "Chin\(index)", photo: UIImage(named: "\(index)"), description: "Description \(index)!!!!", birthday: Date(timeIntervalSinceReferenceDate: TimeInterval(118800 - 3600*24*index)), sex: ChinModel.sexTypes.male, colour: ChinModel.colourTypes.BeigeViolet);
            data.append(item)
        }
        

    }
    
    //MARK: - Guesture Actions
    @objc func swipeHandler(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right:
                
                print("Swiped right")

                self.loadNext()
                
            case UISwipeGestureRecognizerDirection.left:
                
                print("Swiped left")
                loadNext()
                
            default:
                break
            }
        }
    }
    
    
}

