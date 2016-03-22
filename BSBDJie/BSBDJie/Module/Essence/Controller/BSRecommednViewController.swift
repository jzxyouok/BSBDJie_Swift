//
//  BSRecommednViewController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/22.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSRecommednViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tagTab: UITableView!
    
    var tags = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //导航栏标题
        self.navigationItem.title = "推荐标签"
        
        //注册cell
        self.tagTab.registerNib(UINib(nibName: "BSTagCell", bundle: nil), forCellReuseIdentifier: "tagCell")
        self.tagTab.rowHeight = 70
        
        //请求数据
        let manager = AFHTTPSessionManager()
        let params = ["a": "tags_list",
                      "c": "subscribe"]
        manager.GET("http://api.budejie.com/api/api_open.php", parameters: params, success: { (task: NSURLSessionDataTask, response: AnyObject) -> Void in
            
            //解析数据
            self.tags = BSTag.objectArrayWithKeyValuesArray(response["rec_tags"])
            //刷新数据
            self.tagTab.reloadData()
            
            }) { (task: NSURLSessionDataTask, error: NSError) -> Void in
                
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tagCell") as! BSTagCell
        let tag = self.tags[indexPath.row]
        cell.loadData(tag as! BSTag)
        return cell
    }

}
