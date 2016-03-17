//
//  BSCategoryCell.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/17.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSCategoryCell: UITableViewCell {
    
    //指示图标
    @IBOutlet weak var indicator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.indicator.hidden = !selected
        self.textLabel?.textColor = selected ? UIColor.redColor() : UIColor.blackColor()
    }
    
}
