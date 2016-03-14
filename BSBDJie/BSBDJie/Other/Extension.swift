//
//  Extension.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/11.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

extension UIView {
    var width: CGFloat {
        get {
            return self.bounds.size.width
        }
    }
    
    var height: CGFloat {
        get {
            return self.bounds.size.height
        }
    }
    
    var size: CGSize {
        get {
            return self.bounds.size
        }
        set {
            var rect = self.bounds
            rect.size = newValue
            self.bounds = rect
        }
    }
}

extension UIBarButtonItem {
    
    class func item(image image: String, highlightImage: String, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .Custom)
        button.setBackgroundImage((UIImage(named:image)), forState: UIControlState.Normal)
        button.setBackgroundImage((UIImage(named:highlightImage)), forState: UIControlState.Highlighted)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.size = (button.currentBackgroundImage?.size)!
        return UIBarButtonItem(customView: button)
    }
    
    class func item(title title: String, image: String, highlightImage: String, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .Custom)
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        button.setImage((UIImage(named: image)), forState: UIControlState.Normal)
        button.setImage((UIImage(named: highlightImage)), forState: UIControlState.Highlighted)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView: button)
    }
}














