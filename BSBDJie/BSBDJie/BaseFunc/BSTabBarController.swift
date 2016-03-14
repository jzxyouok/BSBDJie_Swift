//
//  BSTabBarController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSTabBarController: UITabBarController {
    
    override class func initialize() {
        //设置tabbar文字属性
        let item = UITabBarItem.appearance()
        item.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.grayColor()], forState:UIControlState.Normal)
        item.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: UIControlState.Selected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //添加子控制器
        createChildVC(BSEssenceViewController(), title: "精华", image: "tabBar_essence_icon", selectedImage: "tabBar_essence_click_icon")
        createChildVC(BSNewViewController(), title: "新帖", image: "tabBar_new_icon", selectedImage: "tabBar_new_click_icon")
        createChildVC(BSNewViewController(), title: "关注", image: "tabBar_friendTrends_icon", selectedImage: "tabBar_friendTrends_click_icon")
        createChildVC(BSNewViewController(), title: "我的", image: "tabBar_me_icon", selectedImage: "tabBar_me_click_icon")
        
        //KVO监听tabba
        self.setValue(BSTabBar(), forKeyPath: "tabBar")
    }
    
    func createChildVC(vc: UIViewController, title: String, image: String, selectedImage: String) {
        vc.view.backgroundColor = UIColor.greenColor()
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)
        
        let nav = BSNavgationController(rootViewController: vc)
        self.addChildViewController(nav)
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
