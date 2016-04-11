//
//  UIViewExt.swift
//  sample4
//
//  Created by yilin liao on 14-7-25.
//  Copyright (c) 2014 eastcom. All rights reserved.
//


import UIKit
import Foundation

extension UIView  {
    
    func x()->CGFloat
    {
        return self.frame.origin.x
    }
    func right()-> CGFloat
    {
        return self.frame.origin.x + self.frame.size.width
    }
    func y()->CGFloat
    {
        return self.frame.origin.y
    }
    func bottom()->CGFloat
    {
        return self.frame.origin.y + self.frame.size.height
    }
    func width()->CGFloat
    {
        return self.frame.size.width
    }
    func height()-> CGFloat
    {
        return self.frame.size.height
    }
    
    func setX(x: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.x = x
        self.frame = rect
    }
    
    func setRight(right: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.x = right - rect.size.width
        self.frame = rect
    }
    
    func setY(y: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.y = y
        self.frame = rect
    }
    
    func setBottom(bottom: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.y = bottom - rect.size.height
        self.frame = rect
    }
    
    func setWidth(width: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.size.width = width
        self.frame = rect
    }
    
    func setHeight(height: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.size.height = height
        self.frame = rect
    }
    
    class func showAlertView(title:String,message:String)
    {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
        
    }
    
    class func showWaitingView(title:String,message:String)->UIAlertView
    {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.show()
        return alert
    }
    
    enum UIViewHorizontalAlign {
        case None, Left, Center, Right
    }
    
    enum UIViewVerticalAlign {
        case None, Top, Center, Bottom
    }
    
    enum UIViewPosition {
        case Top, Right, Bottom, Left, Center
    }
    
    func padding(value: UIEdgeInsets) {
        let top = -value.top
        let right = -value.right
        let bottom = -value.bottom
        let left = -value.left
        self.frame = UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(top, left, bottom, right))
    }
    
    func sizemThatFits(size: CGSize) -> CGSize {
        var s = size
        
        for view in self.subviews {
            let frame = view.frame
            s.width = max(s.width, (frame.origin.x + frame.size.width))
            s.height = max(s.height, (frame.origin.y + frame.size.height))
        }
        
        return s
    }
    
    func addCorner (radius : CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func addStroke (color : CGColor ) {
        self.layer.borderColor = color
        self.layer.borderWidth = 1;
    }
    
    func addTransparentStroke ( ) {
        self.layer.borderColor = UIColor.clearColor().CGColor
        self.layer.borderWidth = 60
    }
    
    
    //MARK:- layout in parent
    
    func layoutTopInParentView() {
        self.layoutTopInParentView(.Center)
    }
    
    func layoutTopInParentView(horinzontalAlign: UIViewHorizontalAlign) {
        self.layoutTopInParentView(horinzontalAlign, offset: CGPointZero)
    }
    
    func layoutTopInParentView(horinzontalAlign: UIViewHorizontalAlign, offset: CGPoint) {
        self.frame = frameInParentView(horinzontalAlign, verticalAlign: .Top, offset: offset)
    }
    
    func layoutBottomInParentView() {
        self.layoutBottomInParentView(.Center)
    }
    
    func layoutBottomInParentView(horinzontalAlign: UIViewHorizontalAlign) {
        self.layoutBottomInParentView(horinzontalAlign, offset: CGPointZero)
    }
    
    func layoutBottomInParentView(horinzontalAlign: UIViewHorizontalAlign, offset: CGPoint) {
        self.frame = frameInParentView(horinzontalAlign, verticalAlign: .Bottom, offset: offset)
    }
    
    func layoutLeftInParentView() {
        self.layoutLeftInParentView(.Center)
    }
    
    func layoutLeftInParentView(verticalAlign: UIViewVerticalAlign) {
        self.layoutLeftInParentView(verticalAlign, offset: CGPointZero)
    }
    
    func layoutLeftInParentView(verticalAlign: UIViewVerticalAlign, offset: CGPoint) {
        self.frame = frameInParentView(.Left, verticalAlign: verticalAlign, offset: offset)
    }
    
    func layoutRightInParentView() {
        self.layoutRightInParentView(.Center)
    }
    
    func layoutRightInParentView(verticalAlign: UIViewVerticalAlign) {
        self.layoutRightInParentView(verticalAlign, offset: CGPointZero)
    }
    
    func layoutRightInParentView(verticalAlign: UIViewVerticalAlign, offset: CGPoint) {
        self.frame = frameInParentView(.Right, verticalAlign: verticalAlign, offset: offset)
    }
    
    func layoutCenterInParentView() {
        self.layoutCenterInParentView(CGPointZero)
    }
    
    func layoutCenterInParentView(offset: CGPoint) {
        self.frame = frameInParentView(.Center, verticalAlign: .Center, offset: offset)
    }
    
    func frameInParentView(horinzontalAlign: UIViewHorizontalAlign, verticalAlign: UIViewVerticalAlign, offset: CGPoint) -> CGRect {
        if let s = self.superview {
            let parentSize = s.bounds.size
            let size = self.bounds.size
            var origin = CGPointZero
            
            switch verticalAlign {
            case .Center:
                origin.y = (parentSize.height - size.height) / 2.0
            case .Bottom:
                origin.y = parentSize.height - size.height
            default:
                origin.y = 0.0
            }
            
            switch horinzontalAlign {
            case .Center:
                origin.x = (parentSize.width - size.width) / 2.0
            case .Right:
                origin.x = parentSize.width - size.width
            default:
                origin.x = 0.0
            }
            
            origin.x += offset.x
            origin.y += offset.y
            
            return CGRect(origin: origin, size: size)
        } else {
            return CGRectZero
        }
    }
    
    //MARK:- layout from sibling
    
    func layoutTopFromSibling(sibling: UIView) {
        self.layoutTopFromSibling(sibling, horizontalAlign: .Center)
    }
    
    func layoutTopFromSibling(sibling: UIView, horizontalAlign: UIViewHorizontalAlign) {
        self.layoutTopFromSibling(sibling, horizontalAlign: horizontalAlign, offset: CGPointZero)
    }
    
    func layoutTopFromSibling(sibling: UIView, horizontalAlign: UIViewHorizontalAlign, offset: CGPoint) {
        self.frame = frameFromSibling(sibling, position: .Top, horizontalAlign: horizontalAlign, verticalAlign: .None, offset: offset)
    }
    
    func layoutBottomFromSibling(sibling: UIView) {
        self.layoutBottomFromSibling(sibling, horizontalAlign: .Center)
    }
    
    func layoutBottomFromSibling(sibling: UIView, horizontalAlign: UIViewHorizontalAlign) {
        self.layoutBottomFromSibling(sibling, horizontalAlign: horizontalAlign, offset: CGPointZero)
    }
    
    func layoutBottomFromSibling(sibling: UIView, horizontalAlign: UIViewHorizontalAlign, offset: CGPoint) {
        self.frame = frameFromSibling(sibling, position: .Bottom, horizontalAlign: horizontalAlign, verticalAlign: .None, offset: offset)
    }
    
    func layoutRightFromSibling(sibling: UIView) {
        self.layoutRightFromSibling(sibling, verticalAlign: .Center)
    }
    
    func layoutRightFromSibling(sibling: UIView, verticalAlign: UIViewVerticalAlign) {
        self.layoutRightFromSibling(sibling, verticalAlign: verticalAlign, offset: CGPointZero)
    }
    
    func layoutRightFromSibling(sibling: UIView, verticalAlign: UIViewVerticalAlign, offset: CGPoint) {
        self.frame = frameFromSibling(sibling, position: .Right, horizontalAlign: .None, verticalAlign: verticalAlign, offset: offset)
    }
    
    func layoutLeftFromSibling(sibling: UIView) {
        self.layoutLeftFromSibling(sibling, verticalAlign: .Center)
    }
    
    func layoutLeftFromSibling(sibling: UIView, verticalAlign: UIViewVerticalAlign) {
        self.layoutLeftFromSibling(sibling, verticalAlign: verticalAlign, offset: CGPointZero)
    }
    
    func layoutLeftFromSibling(sibling: UIView, verticalAlign: UIViewVerticalAlign, offset: CGPoint) {
        self.frame = frameFromSibling(sibling, position: .Left, horizontalAlign: .None, verticalAlign: verticalAlign, offset: offset)
    }
    
    func frameFromSibling(sibling: UIView, position: UIViewPosition, horizontalAlign: UIViewHorizontalAlign, verticalAlign: UIViewVerticalAlign, offset: CGPoint) -> CGRect {
        let siblingFrame = sibling.frame
        let size = self.bounds.size
        var origin = CGPointZero
        
        switch position {
        case .Top:
            origin.y = siblingFrame.origin.y - size.height
            origin.x = horizontalOriginXFromSibling(sibling, horizontalAlign: horizontalAlign)
        case .Bottom:
            origin.y = siblingFrame.origin.y + siblingFrame.size.height
            origin.x = horizontalOriginXFromSibling(sibling, horizontalAlign: horizontalAlign)
        case .Right:
            origin.x = siblingFrame.origin.x + siblingFrame.size.width
            origin.y = verticalOriginYFromSibling(sibling, verticalAlign: verticalAlign)
        default:
            origin.x = siblingFrame.origin.x - size.width
            origin.y = verticalOriginYFromSibling(sibling, verticalAlign: verticalAlign)
        }
        
        origin.x += offset.x
        origin.y += offset.y
        
        return CGRect(origin: origin, size: size)
    }
    
    func horizontalOriginXFromSibling(sibling: UIView, horizontalAlign: UIViewHorizontalAlign) -> CGFloat {
        var x: CGFloat = 0.0
        let siblingFrame = sibling.frame
        let size = self.bounds.size
        
        switch horizontalAlign {
        case .Left:
            x = siblingFrame.origin.x
        case .Center:
            x = (siblingFrame.size.width - size.width) / 2.0 + siblingFrame.origin.x
        case .Right:
            x = siblingFrame.origin.x + siblingFrame.size.width - size.width
        default:
            x = 0.0
        }
        
        return x
    }
    
    func verticalOriginYFromSibling(sibling: UIView, verticalAlign: UIViewVerticalAlign) -> CGFloat {
        var y: CGFloat = 0.0
        let siblingFrame = sibling.frame
        let size = self.bounds.size
        
        switch verticalAlign {
        case .Top:
            y = siblingFrame.origin.y
        case .Center:
            y = (siblingFrame.size.height - size.height) / 2.0 + siblingFrame.origin.y
        case .Bottom:
            y = siblingFrame.origin.y + siblingFrame.size.height - size.height
        default:
            y = 0.0
        }
        
        return y
    }
    
}
