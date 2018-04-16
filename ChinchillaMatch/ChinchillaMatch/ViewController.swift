//
//  ViewController.swift
//  ChinchillaMatch
//
//  Created by Li Shuzu on 16/04/18.
//  Copyright © 2018 TornadoLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - Properties
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let numPages = 6
    var pages = [UIView?]()
    var transitioning = false
    
    
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
        
        pageControl.numberOfPages = numPages
        pageControl.currentPage = 0
        pageControl.isHidden = true;
        
        imageScrollView.delegate = self;
        imageScrollView.isPagingEnabled = true
        imageScrollView.isScrollEnabled = true
        

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
        
        // Pages are created on demand, load the visible page and next page.
        adjustScrollView()
        loadPage(0)
        loadPage(1)
    }()
    
    // MARK: - Utilities
    
    fileprivate func removeAnyImages() {
        for page in pages where page != nil {
            page?.removeFromSuperview()
        }
    }
    
    /// Readjust the scroll view's content size in case the layout has changed.
    fileprivate func adjustScrollView() {
        imageScrollView.contentSize =
            CGSize(width: imageScrollView.frame.width * CGFloat(numPages),
                   height: imageScrollView.frame.height)
    }
    
    // MARK: - Transitioning
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        /**
         Since we transitioned to a different screen size we need to reconfigure the scroll view content.
         Remove any the pages from our scrollview's content.
         */
        removeAnyImages()
        
        coordinator.animate(alongsideTransition: nil) { _ in
            // Adjust the scroll view's contentSize (larger or smaller) depending on the new transition size.
            self.adjustScrollView()
            
            // Clear out and reload the relevant pages.
            self.pages = [UIView?](repeating: nil, count: self.numPages)
            
            self.transitioning = true
            
            // Go to the appropriate page (but with no animation).
            self.gotoPage(page: self.pageControl.currentPage, animated: false)
            
            self.transitioning = false
        }
        
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    // MARK: - Page Loading
    
    fileprivate func loadPage(_ page: Int) {
        print("Load page\(page)")
        guard page < numPages && page != -1 else { return }
        
        if pages[page] == nil {
            if let image = UIImage(named: "\(page + 1)") {
                // Load the image from our bundle.
                let newImageView = UIImageView(image: image)
                newImageView.contentMode = .scaleAspectFit
                
                /**
                 Setup the canvas view to hold the image.
                 Its frame will be the same as the scroll view's frame.
                 */
                var frame = imageScrollView.frame
                // Offset the frame's X origin to its correct page offset.
                frame.origin.x = (frame.size.width) * CGFloat(page)

                // Set frame's y origin value to take into account the top layout guide.
                
                let canvasView = UIView(frame: frame)
                imageScrollView.addSubview(canvasView)
                
                // Setup the imageView's constraints to snap to all sides of its superview (canvasView).
                newImageView.translatesAutoresizingMaskIntoConstraints = false
                canvasView.addSubview(newImageView)
                
                NSLayoutConstraint.activate([
                    (newImageView.leadingAnchor.constraint(equalTo: canvasView.leadingAnchor)),
                    (newImageView.trailingAnchor.constraint(equalTo: canvasView.trailingAnchor)),
                    (newImageView.topAnchor.constraint(equalTo: canvasView.topAnchor)),
                    (newImageView.bottomAnchor.constraint(equalTo: canvasView.bottomAnchor))
                    ])
                
                pages[page] = canvasView
            }
        }
    }
    
    fileprivate func loadCurrentPages(page: Int) {
        // Load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling).
        
        // Don't load if we are at the beginning or end of the list of pages.
        guard (page > 0 && page + 1 < numPages) || transitioning else { return }
        
        // Remove all of the images and start over.
        removeAnyImages()
        pages = [UIView?](repeating: nil, count: numPages)
        
        // Load the appropriate new pages for scrolling.
        loadPage(Int(page) - 1)
        loadPage(Int(page))
        loadPage(Int(page) + 1)
    }
    
    fileprivate func gotoPage(page: Int, animated: Bool) {
        loadCurrentPages(page: page)
        
        // Update the scroll view scroll position to the appropriate page.
        var bounds = imageScrollView.bounds
        bounds.origin.x = bounds.width * CGFloat(page)
        bounds.origin.y = 0
        imageScrollView.scrollRectToVisible(bounds, animated: animated)
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Switch the indicator when more than 50% of the previous/next page is visible.

        
        let pageWidth = scrollView.frame.size.width
        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
//        print("x: \(scrollView.contentOffset.x) / pageWidth: \(pageWidth)")
        
        
        pageControl.currentPage = Int(page)
        
        loadCurrentPages(page: pageControl.currentPage)
    }
    
    // MARK: - Actions
    
    @IBAction func gotoPage(_ sender: UIPageControl) {
        // User tapped the page control at the bottom, so move to the newer page, with animation.
        gotoPage(page: sender.currentPage, animated: true)
    }
    
}

