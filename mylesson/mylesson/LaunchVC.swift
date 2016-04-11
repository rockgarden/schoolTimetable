//
//  LauncherVC.swift
//  mylesson
//
//  Created by wangkan on 16/4/11.
//  Copyright © 2016年 wk. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ParallaxItem(image: UIImage(named: "item1")!, text: "SHARE LIGHTBOXES WITH YOUR TEAM")
        let item2 = ParallaxItem(image: UIImage(named: "item2")!, text: "FOLLOW WORLD CLASS PHOTOGRAPHERS")
        let item3 = ParallaxItem(image: UIImage(named: "item3")!, text: "EXPLORE OUR COLLECTION BY CATEGORY")
        
        let mParallaxViewController = RMParallax(items: [item1, item2, item3], motion: false)
        mParallaxViewController.completionHandler = {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                mParallaxViewController.view.alpha = 0.0
            })
        }
        
        // Adding parallax view controller.
        self.addChildViewController(mParallaxViewController)
        self.view.addSubview(mParallaxViewController.view)
        mParallaxViewController.didMoveToParentViewController(self)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

