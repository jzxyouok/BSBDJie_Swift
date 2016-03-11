//
//  BSEssenceViewController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSEssenceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置导航栏标题
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        
        //设置导航栏item
        let button = UIButton(type: .Custom)
        button.setBackgroundImage((UIImage(named: "MainTagSubIcon")), forState: UIControlState.Normal)
        button.setBackgroundImage((UIImage(named: "MainTagSubIconClick")), forState: UIControlState.Highlighted)
        button.addTarget(self, action: "tagClick", forControlEvents: UIControlEvents.TouchUpInside)
        button.size = (button.currentBackgroundImage?.size)!
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func tagClick() {
       print("tag")
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
