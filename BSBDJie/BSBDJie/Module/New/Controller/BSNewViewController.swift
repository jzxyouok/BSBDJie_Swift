//
//  BSNewViewController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSNewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置导航栏标题
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        
        //设置导航栏item
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.item(image: "MainTagSubIcon", highlightImage: "MainTagSubIconClick", target: self, action: "newClick")
    }

    func newClick() {
        print("new")
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
