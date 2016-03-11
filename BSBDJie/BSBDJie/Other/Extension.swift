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

}














