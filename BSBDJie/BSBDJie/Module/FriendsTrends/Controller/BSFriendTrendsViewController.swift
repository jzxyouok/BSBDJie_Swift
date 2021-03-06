//
//  BSFriendTrendsViewController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/10.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSFriendTrendsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏标题
        self.navigationItem.title = "关注"
        
        //设置导航栏item
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.item(image: "friendsRecommentIcon", highlightImage: "friendsRecommentIcon-click", target: self, action: "friendsClick")
    }
    
    func friendsClick() {
       let recommendVC = BSRecommendViewController()
        self.navigationController?.pushViewController(recommendVC, animated: true)
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
