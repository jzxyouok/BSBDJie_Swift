//
//  BSTagCell.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/22.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSTagCell: UITableViewCell {
    @IBOutlet weak var image_listImageView: UIImageView!
    @IBOutlet weak var theme_nameLabel: UILabel!
    
    @IBOutlet weak var sub_numberLabel: UILabel!
    
//    override var frame: CGRect {
//        return CGRect(x: 10, y: 0, width: self.width-20, height: self.height-1)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(tag: BSTag) {
    
        self.image_listImageView.sd_setImageWithURL(NSURL(string: tag.image_list), placeholderImage: UIImage(named: "defaultUserIcon"))
        self.theme_nameLabel.text = tag.theme_name
        var num = 0
        if (tag.sub_number > 10000) {
            num = tag.sub_number/10000
        } else {
            num = tag.sub_number
        }
        self.sub_numberLabel.text = "\(CGFloat(num))" + "关注"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
