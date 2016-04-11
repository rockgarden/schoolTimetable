//
//  StoryboradExtensions.swift
//  ICSLA
//
//  Created by JarlRyan on 14/7/28.
//  Copyright (c) 2014年 eastcom. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    class func getViewControllerFromStoryboard(viewController:NSString, storyboard:NSString) -> UIViewController {
        let sBoard = UIStoryboard(name: storyboard as String, bundle: nil)
        let vController: UIViewController = sBoard.instantiateViewControllerWithIdentifier(viewController as String) 
        return vController
    }
}