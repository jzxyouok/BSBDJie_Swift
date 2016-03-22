//
//  BSRecommendViewController.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/14.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSRecommendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let categoryCellId = "categoryCell"
    let userCellId = "userCell"
    
    @IBOutlet weak var categoryTab: UITableView!
    var categories = []
    var selectedCategory: BSCategory?
    @IBOutlet weak var userTab: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //注册cell
        self.categoryTab.registerNib(UINib(nibName: "BSCategoryCell", bundle: nil), forCellReuseIdentifier: categoryCellId)
        self.userTab.registerNib(UINib(nibName: "BSUserCell", bundle: nil), forCellReuseIdentifier: userCellId)
        self.userTab.rowHeight = CGFloat(70)
        self.userTab.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
        //设置导航栏主题
        self.navigationItem.title = "推荐关注"
    
        //设置导航栏
        self.userTab.header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadNewData")
        self.userTab.footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "loadMoreData")
        
        //加载左侧类别列表
        self.loadCategories()
    }
    
    func loadCategories() {
        //显示loading框
        SVProgressHUD.show()
        
        //发送网络请求
        let param = ["a": "category",
            "c": "subscribe"]
        let manager = AFHTTPSessionManager()
        manager.GET("http://api.budejie.com/api/api_open.php", parameters: param, success: { (NSURLSessionDataTask: NSURLSessionDataTask, response: AnyObject) -> Void in
            
            //解析数据
            self.categories = BSCategory.objectArrayWithKeyValuesArray(response["list"])
            
            //刷新左边类型列表
            self.categoryTab.reloadData()
            
            //隐藏loading
            SVProgressHUD.dismiss()
            
            //默认选中
            let indexPath = NSIndexPath(forItem: 0, inSection: 0)
            self.categoryTab.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
            self.selectedCategory = self.categories[0] as? BSCategory
            
            //默认刷新第一页数据
            self.userTab.header.beginRefreshing()
            
            }) { (NSURLSessionDataTask: NSURLSessionDataTask, error: NSError) -> Void in
        }
    }
    
    func loadNewData() {
        
        if let category = self.selectedCategory {
            category.currentPage = 1
            let params = ["a": "list",
                "c": "subscribe",
                "category_id": "\(category.id)",
                "page": "\(category.currentPage)"]
            let manager = AFHTTPSessionManager()
            manager.GET("http://api.budejie.com/api/api_open.php", parameters: params, success: { (task: NSURLSessionDataTask, response: AnyObject) -> Void in
                
                //解析数据
                let users = BSUser.objectArrayWithKeyValuesArray(response["list"])
                //category.users.arrayByAddingObjectsFromArray(users as [AnyObject])
                category.users.removeAllObjects()
                for item in users {
                    category.users.addObject(item)
                }
                
                //记录数据总数
                category.total = response["total"] as! Int
                
                //刷新数据
                self.userTab.reloadData()
                
                //结束刷新
                self.userTab.header.endRefreshing()
                
                }) { (tase: NSURLSessionDataTask, error: NSError) -> Void in
                    
                    //结束刷新
                    self.userTab.header.endRefreshing()
            }
        }
    }
    
    func loadMoreData() {
        
        if let category = self.selectedCategory {
            let params = ["a": "list",
                "c": "subscribe",
                "category_id": "\(category.id)",
                "page": "\(++category.currentPage)"]
            let manager = AFHTTPSessionManager()
            manager.GET("http://api.budejie.com/api/api_open.php", parameters: params, success: { (task: NSURLSessionDataTask, response: AnyObject) -> Void in
                
                //解析数据
                let users = BSUser.objectArrayWithKeyValuesArray(response["list"])
                //category.users.arrayByAddingObjectsFromArray(users as [AnyObject])
                for item in users {
                    category.users.addObject(item)
                }
                
                //刷新数据
                self.userTab.reloadData()
                
                }) { (tase: NSURLSessionDataTask, error: NSError) -> Void in
                    
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.categoryTab) {
            return self.categories.count
        } else {
            if let category  = self.selectedCategory {
                if (category.total == category.users.count) {
                   self.userTab.footer.noticeNoMoreData()
                } else {
                    self.userTab.footer.endRefreshing();
                }
                return category.users.count
            }
            return -1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (tableView == self.categoryTab) {
            let cell = tableView.dequeueReusableCellWithIdentifier(categoryCellId)
            let category = self.categories[indexPath.row]
            cell?.textLabel?.text = category.name
            return cell!
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(userCellId) as! BSUserCell
            if let category = self.selectedCategory {
                if (indexPath.row < category.users.count) {
                    let user = category.users[indexPath.row]
                    cell.setupUser(user as! BSUser)
                }
            }
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (tableView == self.categoryTab) {
            let category = self.categories[indexPath.row] as! BSCategory;
            self.selectedCategory = category
            self.userTab.header.beginRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
