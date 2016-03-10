//
//  BSTabBar.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSTabBar: UITabBar {

    var publishButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        publishButton = UIButton(type: .Custom)
        publishButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), forState: UIControlState.Normal)
        publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), forState: UIControlState.Selected)
        self.addSubview(publishButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let publishButtonW = publishButton.currentBackgroundImage?.size.width
        let publishButtonH = publishButton.currentBackgroundImage?.size.height
        
        publishButton.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        publishButton.bounds = CGRect(x: 0, y: 0, width: publishButtonW!, height: publishButtonH!)
        
        var index = 0
        let buttonW = self.bounds.size.width/5
        let buttonH = self.bounds.size.height
        for button in self.subviews {
            if (!button.isKindOfClass(NSClassFromString("UITabBarButton")!)) {
                continue
            }
            let i = index > 1 ? (index + 1) : index
            button.frame = CGRect(x: (buttonW * CGFloat(i)), y: 0, width: buttonW, height: buttonH)
            index++
        }
    }
}
