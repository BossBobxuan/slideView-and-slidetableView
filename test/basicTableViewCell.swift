//
//  basicTableViewCell.swift
//  test
//
//  Created by Bossxuan on 16/11/25.
//  Copyright © 2016年 Bossxuan. All rights reserved.
//

import UIKit

class basicTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
