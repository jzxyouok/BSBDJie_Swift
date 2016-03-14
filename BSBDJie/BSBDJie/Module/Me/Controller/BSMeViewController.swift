//
//  BSMeViewController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏标题
        self.navigationItem.title = "我的"
        
        //设置导航栏item
        let settingItem = UIBarButtonItem.item(image: "mine-setting-icon", highlightImage: "mine-setting-icon-click", target: self, action: "settingClick")
        let moonItem = UIBarButtonItem.item(image: "mine-moon-icon", highlightImage: "mine-moon-icon-click", target: self, action: "moonClick")
        self.navigationItem.rightBarButtonItems = [settingItem, moonItem]
    }
    
    func settingClick() {
       print("setting")
    }
    
    func moonClick() {
      print("moon")
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
