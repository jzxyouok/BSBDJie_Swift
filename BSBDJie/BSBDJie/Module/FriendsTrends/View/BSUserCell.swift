//
//  BSUserCell.swift
//  BSBDJie
//
//  Created by shengguoqiang on 16/3/17.
//  Copyright © 2016年 shengguoqiang. All rights reserved.
//

import UIKit

class BSUserCell: UITableViewCell {
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var screenNameLabel: UILabel!
    
    @IBOutlet weak var fanCountLabel: UILabel!
    
    var user: BSUser!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUser(user: BSUser) {
        self.user = user
        self.headerImageView.sd_setImageWithURL(NSURL(string: user.header), placeholderImage: UIImage(named: "defaultUserIcon"))
        self.screenNameLabel.text = user.screen_name
        self.fanCountLabel.text = "\(user.fans_count)关注"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
