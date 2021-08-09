//
//  ParkTableViewCell.swift
//  NPF_4
//
//  Created by Ike Chukz on 8/9/21.
//  Copyright © 2021 Ikemefuna Chukwunyerenwa. All rights reserved.
//

import UIKit

class ParkTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
