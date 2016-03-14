//
//  BSRecommendViewController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/14.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSRecommendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置导航栏主题
        self.navigationItem.title = "推荐关注"
        
        //显示loading框
        SVProgressHUD.show()
        
        //发送网络请求
        let param = ["a": "category",
                     "c": "subscribe"]
        let manager = AFHTTPSessionManager()
        manager.GET("http://api.budejie.com/api/api_open.php", parameters: param, success: { (NSURLSessionDataTask: NSURLSessionDataTask, response: AnyObject) -> Void in
            
            print(response)
            
            //隐藏loading
            SVProgressHUD.dismiss()
            
            }) { (NSURLSessionDataTask: NSURLSessionDataTask, error: NSError) -> Void in
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
