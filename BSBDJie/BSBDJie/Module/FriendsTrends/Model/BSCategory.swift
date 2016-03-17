//
//  BSCategory.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/17.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSCategory: NSObject {

    var id: Int = 0
    var name: String = ""
    var count: Int = 0
    //用户数组
    var users: NSMutableArray = []
    
    //当前页
    var currentPage = 0
}
