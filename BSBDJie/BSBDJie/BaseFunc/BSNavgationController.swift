//
//  BSNavgationController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/11.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSNavgationController: UINavigationController, UIGestureRecognizerDelegate{

    override class func initialize() {
        let bar = UINavigationBar.appearance()
        bar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: UIBarMetrics.Default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //处理【自定义返回按钮或隐藏导航栏时，系统手势失效！！！】问题
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if (self.viewControllers.count > 0) {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.item(title: "返回", image: "navigationButtonReturn", highlightImage: "navigationButtonReturnClick", target: self, action: "backClick")
            
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
