//
//  BSNavgationController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/11.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSNavgationController: UINavigationController, UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //处理【自定义返回按钮或隐藏导航栏时，系统手势失效！！！】问题
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if (self.viewControllers.count > 0) {
        
            let button = UIButton(type: .Custom)
            button.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
            button.setTitle("返回", forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            button.setImage((UIImage(named: "navigationButtonReturn")), forState: UIControlState.Normal)
            button.setImage((UIImage(named: "navigationButtonReturnClick")), forState: UIControlState.Highlighted)
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
            button.addTarget(self, action: "backClick", forControlEvents: UIControlEvents.TouchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func backClick() {
        self.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
