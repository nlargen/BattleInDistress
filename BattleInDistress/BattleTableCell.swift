//
//  BattleTableCell.swift
//  BattleInDistress
//
//  Created by Nicholas Largen on 12/10/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import UIKit

class BattleTableCell: UITableViewCell {
    
    
    @IBOutlet weak var BattleNameLabel: UILabel!
    @IBOutlet weak var BattlePhoneLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
