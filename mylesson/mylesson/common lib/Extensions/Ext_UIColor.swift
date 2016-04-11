//
//  AppColor.swift
//  ICSLA
//
//  Created by wangkan on 14-8-4.
//  Copyright (c) 2014年 eastcom. All rights reserved.
//  定义应用专用颜色

import UIKit

extension UIColor {
    
    class func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return self.rgba(r, g: g, b: b, a: 1.0)
    }
    
    class func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    class func frgb(rgbValue: UInt32) -> UIColor {
        return UIColor(red: (CGFloat)((rgbValue & 0xFF0000) >> 16)/255.0, green: (CGFloat)((rgbValue & 0xFF00) >> 8)/255.0,blue: (CGFloat)(rgbValue & 0xFF)/255.0, alpha: 1.0)
    }
}

extension UIColor {
    
    class func appBlueColor() -> UIColor {
        return UIColor.rgb(10, g: 128, b: 250)
    }
    
    private class func blueRedColor() -> UIColor {
        return self.rgb(76.0, g: 134.0, b: 237.0)
    }

    private class func whiteColor() -> UIColor {
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.9)
    }
    
    private class func alphaWhiteColor() -> UIColor {
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.2)
    }
    
    private class func whiteBlueColor() -> UIColor {
        return UIColor(red: 250/255.0, green: 250/255.0, blue: 255/255.0, alpha: 1)
    }
    
    private class func whiteGreenColor() -> UIColor {
        return UIColor(red: 250/255.0, green: 255/255.0, blue: 250/255.0, alpha: 0.8)
    }
    
    private class func blackColor() -> UIColor {
        return UIColor(red: 100/255.0, green: 128/255.0, blue: 155/255.0, alpha: 0.8)
    }
    
    private class func buttonTitleColor() -> UIColor {
        return UIColor(red: 0/255.0, green: 128/255.0, blue: 255/255.0, alpha: 1)
    }
    
    private class func textShadowColor() -> UIColor {
        return UIColor(red: 0.0, green: 0.0, blue: 0.1, alpha: 0.3)
    }
    
    private class func greenColor() -> UIColor {
        return UIColor.rgb(30, g:180, b: 20)
    }
    
    private class func itemTitleTextColor() -> UIColor {
        return UIColor.rgb(255, g:80, b: 20)
    }
    
    private class func lightGrayColor() -> UIColor {
        return UIColor.rgb(111, g: 111, b: 111)
    }
    
    private class func halfRedColor() -> UIColor {
        return UIColor.rgb(166, g: 1, b: 1)
    }
    private class func darkColor() -> UIColor {
        return UIColor.rgba(52.0, g:73.0, b:94.0, a:1.0)
    }
    
    // FlatColor
    public class func flatRedColor() -> UIColor {
        return frgb(0xE74C3C)
    }
    
    public class func flatDarkRedColor() -> UIColor {
        return frgb(0xC0392B)
    }
    
    // 静态方法
    public class func flatGreenColor() -> UIColor {
        return frgb(0x2ECC71)
    }
    
    public class func flatDarkGreenColor() -> UIColor {
        return frgb(0x27AE60)
    }
    
    public class func flatBlueColor() -> UIColor {
        return frgb(0x3498DB)
    }
    
    public class func alphaFlatBlueColor() -> UIColor {
        return frgb(0x99CCFF)
    }
    
    public class func flatDarkBlueColor() -> UIColor {
        return frgb(0x2980B9)
    }
    
    public class func flatTealColor() -> UIColor {
        return frgb(0x1ABC9C)
    }
    
    public class func flatDarkTealColor() -> UIColor {
        return frgb(0x16A085)
    }
    
    public class func flatPurpleColor() -> UIColor {
        return frgb(0x9B59B6)
    }
    
    public class func flatDarkPurpleColor() -> UIColor {
        return frgb(0x8E44AD)
    }
    
    public class func flatYellowColor() -> UIColor {
        return frgb(0xF1C40F)
    }
    
    public class func flatDarkYellowColor() -> UIColor {
        return frgb(0xF39C12)
    }
    
    public class func flatOrangeColor() -> UIColor {
        return frgb(0xE67E22)
    }
    
    public class func flatDarkOrangeColor() -> UIColor {
        return frgb(0xD35400)
    }
    
    public class func flatGrayColor() -> UIColor {
        return frgb(0x95A5A6)
    }
    
    public class func flatDarkGrayColor() -> UIColor {
        return frgb(0x7F8C8D)
    }
    
    public class func flatWhiteColor() -> UIColor {
        return frgb(0xECF0F0)//frgb(0xECF0F1)
    }
    
    public class func flatDarkWhiteColor() -> UIColor {
        return frgb(0xBDC3C7)
    }
    
    public class func flatBlackColor() -> UIColor {
        return frgb(0x34495E)
    }
    
    public class func flatDarkBlackColor() -> UIColor {
        return frgb(0x2C3E50)
    }
    
    public class func keyDayColor() -> UIColor {
        return frgb(0x7E7E7E)
    }
    
    public class func flatDarkColor() -> UIColor {
        return frgb(0x203E50)
    }
    
    private class func valueDayColor() -> UIColor {
        return frgb(0x000000)
    }
    
}


class UIColorDay : NSObject {
    
    //定义进度动画颜色
    class func activityIndicatorViewStyle(b:Bool) -> UIActivityIndicatorViewStyle {
        if b {
            return UIActivityIndicatorViewStyle.Gray
        }else{
            return UIActivityIndicatorViewStyle.White
        }
    }
    
    // UIViewController--title--textColor
    class func TitleTextColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatWhiteColor()
        } else {
            return UIColor.frgb(0x009aff)
        }
    }
    
    // UIViewController--subTitle--textColor
    class func subTitleTextColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatTealColor()
        } else {
            return UIColor.blackColor()
        }
    }
    
    // UIWindows--backgroundColor
    class func backgroundColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkColor()
        } else {
            return UIColor.flatWhiteColor()
        }
    }
    
    // tableCell--backgroundColor
    class func cellbackgroundColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatBlackColor()
        } else {
            return UIColor.whiteBlueColor()
        }
    }
    
    // tableCell--contentView--backgroundColor
    class func cellViewColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatBlackColor()
        } else {
            return UIColor.whiteBlueColor()
        }
    }
    
    // tableCell--title--textColor
    class func cellTitleColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatWhiteColor()
        } else {
            return UIColor.flatDarkBlackColor()
        }
    }
    
    // tableCell--SubTitle--textColor
    class func cellDetailColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkWhiteColor()
        } else {
            return UIColor.flatDarkGrayColor()
        }
    }
    
    // tableCell--SelectedBackgroundView--SelectedColor
    class func cellSelectedColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.alphaFlatBlueColor()
        } else {
            return UIColor.alphaFlatBlueColor()
        }
    }
    
    // MDSpreadView--HeaderCell--BackgroundColor
    class func MDSpreadViewHeaderCellView(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkColor()
        } else {
            return UIColor.frgb(0xe5f2ff)
        }
    }
    
    // MDSpreadView--Cell--BackgroundColor
    class func MDSpreadViewCellView(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatBlackColor()
        } else {
            return UIColor.whiteBlueColor()
        }
    }
    
    // tableHeaderView--BackgroundColor
    class func secondTableHeaderView(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkColor()
        } else {
            return UIColor.frgb(0xe5f2ff)
        }
    }
    
    // navBar&tabBar--backgroundColor
    class func barBackgroundColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatBlackColor()
        } else {
            return UIColor.whiteBlueColor()
        }
    }
    
    // navBar&tabBar--tintColor
    class func BarTintColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.whiteBlueColor()
        } else {
            return UIColor.frgb(0x0076ff)//0x009aff
        }
    }
    
    // layer--borderColor
    class func layerBorderColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatGrayColor()
        } else {
            return UIColor.flatDarkGrayColor()
        }
    }
    
    // segmentedControl--backgroundColor
    class func segmentedControl(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkBlueColor()
        } else {
            return UIColor.frgb(0xe5f2ff)
        }
    }
    

    // 定义tableSeparator颜色
    class func separatorColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkWhiteColor()
        } else {
            return UIColor.flatGrayColor()
        }
    }
    
    // tableCell的详细信息的标题着色
    class func KeyNameColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkWhiteColor()
        } else {
            return UIColor.keyDayColor()
        }
    }
    
    // 详细信息（KV）的value着色
    class func valueTitleColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatWhiteColor()
        } else {
            return UIColor.valueDayColor()
        }
    }
    
    // searchBar--barTintColor
    class func searchBarColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatDarkBlackColor()
        } else {
            return UIColor.frgb(0x4dbbff)
        }
    }
    
    // navBar--UIBarButtonItem--tintColor
    class func buttonTitleColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatGreenColor()
        } else {
            return UIColor.frgb(0x009aff)
        }
    }
    
    // alarmValue--textColor
    class func AlarmTextColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.flatTealColor()
        } else {
            return UIColor.appBlueColor()
        }
    }
    
    // tableCellItem--tintColor
    class func CellItemColor(b:Bool) -> UIColor {
        if b == false {
            return UIColor.frgb(0xbdc3c7)
        } else {
            return UIColor.frgb(0x009aff)
        }
    }
    
    class func buttonBackgroundColor() -> UIColor {
        return UIColor.blackColor()
    }
    
    class func textShadowColor() -> UIColor {
        return UIColor.textShadowColor()
    }
    
    class func clickColor() -> UIColor {
        return UIColor.greenColor()
    }
    
    class func itemTitleTextColor() -> UIColor {
        return UIColor.itemTitleTextColor()
    }
    
    class func CommentLightGrayColor() -> UIColor {
        return UIColor.lightGrayColor()
    }
    
}




