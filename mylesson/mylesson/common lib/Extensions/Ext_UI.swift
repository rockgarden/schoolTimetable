//
//  CommonUI.swift
//  ICSLA
//
//  Created by wangkan on 14-9-1.
//  Copyright (c) 2014年 eastcom. All rights reserved.
//  共用的View UI配置


import Foundation
import UIKit

enum AppFontSize: Int {
    case font1 = 11, font2 = 13, font3 = 15, font4 = 17, font5 = 19
    case cellSubTitle = 12, cellTitle = 14, navigationBarTitle = 18
    
    func valueOf() -> CGFloat {
        return CGFloat(self.rawValue)
    }
}

enum ComponentSize: Int {
    case HorinzontalScrollerHeight = 55
    
    func valueOf() -> CGFloat {
        return CGFloat(self.rawValue)
    }
}

extension UITableView {
    func insertRowToBottom(indexPaths: [NSIndexPath]) {
        UIView.setAnimationsEnabled(false)
        self.beginUpdates()
        self.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .None)
        self.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
}

extension UILabel {
    class func systemFontLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(fontSize)
        label.font = UIFont(name: "STHeitiSC-Light", size: fontSize)
        label.text = text
        label.textAlignment = .Center
        return label
    }
    
    class func boldFontLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFontOfSize(fontSize)
        label.text = text
        label.textAlignment = .Center
        return label
    }
    
    func labelHeight() -> CGFloat{
        var contentSize = CGSize(width: 0,height: 0)
        let textString : NSString = ""
        let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue
        if (IS_IOS7 >= 7.0) {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = self.lineBreakMode
            paragraphStyle.alignment = self.textAlignment
            let attributes = [NSFontAttributeName : self.font,NSParagraphStyleAttributeName : paragraphStyle]
            contentSize = textString.boundingRectWithSize(CGSizeMake(self.frame.size.width, 20000), options: .UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        }else {
            //contentSize = textString.sizeWithFont(self.font, constrainedToSize: CGSizeMake(self.frame.size.width, 20000), lineBreakMode: self.lineBreakMode)
        }
        return contentSize.height
    }
    
    // 计算Label高度
    class func heightForLabel(text: NSString,maxWidth: CGFloat,font: UIFont,lineBreakMode: NSLineBreakMode) -> CGFloat{
        var contentSize = CGSize(width: 0,height: 0)
        /*
        switch UIDevice.currentDevice().systemVersion.compare("7.0.0", options: NSStringCompareOptions.NumericSearch) {
        case .OrderedSame, .OrderedDescending:
            print("iOS >= 8.0")
        case .OrderedAscending:
            print("iOS < 8.0")
        }
        */
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_0) {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode
            let attributes = [NSFontAttributeName : font,NSParagraphStyleAttributeName : paragraphStyle]
            contentSize = text.boundingRectWithSize(CGSizeMake(maxWidth, 20000), options: .UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        }else {
            //contentSize = text.sizeWithFont(font, constrainedToSize: CGSizeMake(maxWidth, 2000), lineBreakMode: lineBreakMode)
        }
        return contentSize.height
    }
}

extension UIButton {
    
    func verticalAlignContent(imageSize: CGSize) {
        self.titleLabel!.sizeToFit()
        let titleSize = self.titleLabel!.bounds.size
        let spacing: CGFloat = 3.0
        self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0, 0, -titleSize.width)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width), -(imageSize.height + spacing), 0)
    }
    
    class func barButtonItem(title: String?, image: UIImage?, target: AnyObject, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .Custom)
        
        if let t = title {
            button.setTitle(t, forState: .Normal)
            button.titleLabel!.font = UIFont.boldSystemFontOfSize(AppFontSize.font2.valueOf())
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        
        if let i = image {
            button.setImage(i, forState: .Normal)
        }
        
        button.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
        button.padding(UIEdgeInsetsMake(5, 5, 5, 5))

        return UIBarButtonItem(customView: button)
    }

    class func imageBarButtonItem(image: UIImage?, target: AnyObject, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .System)
        button.frame = CGRectMake(0, 0, 44, 44)
        if let i = image {
            button.setImage(i, forState: .Normal)
        }
        button.tintColor = UIColor.redColor()
        button.accessibilityLabel = NSLocalizedString("Button", comment: "")
        button.addTarget(target, action: selector, forControlEvents: .TouchUpInside)

        return UIBarButtonItem(customView: button)
    }

}


public extension UIButton {
    
    public func setImageTintColor(color: UIColor, state: UIControlState) {
        let image = self.imageForState(state)
        if image != nil {
            self.setImage(self.tintedImageWithColor(color, image: image!), forState: state)
        }
    }
    
    public func setBackgroundTintColor(color: UIColor, state: UIControlState) {
        let backgroundImage = self.backgroundImageForState(state)
        if backgroundImage != nil {
            self.setBackgroundImage(self.tintedImageWithColor(color, image: backgroundImage!), forState: state)
        }
    }
    
    private func tintedImageWithColor(tintColor: UIColor, image: UIImage) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, UIScreen.mainScreen().scale)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, 0, image.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        
        let rect = CGRectMake(0, 0, image.size.width, image.size.height)
        
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        CGContextDrawImage(context, rect, image.CGImage)
        
        CGContextSetBlendMode(context, CGBlendMode.SourceIn)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return coloredImage
    }
}

func mainWindow() -> UIWindow {
    return UIApplication.sharedApplication().windows[0] 
}

//func selectedController() -> UIViewController {
//    var tabBarController = mainWindow().rootViewController as! UITabBarController
//    return tabBarController.selectedViewController!
//}

//func navigationBarHeight() -> Float {
//    //var navigator = selectedController() as! UINavigationController
//    return navigator.navigationBar.bounds.size.height.swValue()
//}

//MARK:- 获取状态栏高度
func statusBarHeight() -> Float { //-swValue转换CGFloat
    let application = UIApplication.sharedApplication()
    let orientation = application.statusBarOrientation
    let statusBarFrame = application.statusBarFrame
    let versions = UIDevice.currentDevice().systemVersion.componentsSeparatedByString(".")
    if versions[0] == "7" {
        // ios 7 code
        switch orientation {
        case UIInterfaceOrientation.Portrait, UIInterfaceOrientation.PortraitUpsideDown:
            return statusBarFrame.height.swValue()
        case UIInterfaceOrientation.LandscapeLeft, UIInterfaceOrientation.LandscapeRight:
            return statusBarFrame.size.width.swValue()
        default:
            return statusBarFrame.size.height.swValue()
        }
    } else if versions[0] == "8" {
        // ios 8 code
        return statusBarFrame.height.swValue()
    } else {
        return 20.0
    }
}

//func commonTopMargin() -> Float {
//    return statusBarHeight() + navigationBarHeight()
//}

func unique<T: Equatable>(a: [T], b: [T]) -> [T] {
    return a.filter {
        return b.contains($0)
    }
}

extension CGFloat {
    func swValue() -> Float {
        return Float(self)
    }
}

extension Float {
    func cgValue() -> CGFloat {
        return CGFloat(self)
    }
}

extension String {
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func range() -> NSRange {
        let string = self as NSString
        return NSMakeRange(0, string.length)
    }
    
}

extension UIImage {
    class func createImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}