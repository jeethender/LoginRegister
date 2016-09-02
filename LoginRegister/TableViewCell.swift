//
//  TableViewCell.swift
//  LoginRegister
//
//  Created by maisapride8 on 24/06/16.
//  Copyright © 2016 maisapride8. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell
{
    
    @IBOutlet weak var yakText: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var replies: UILabel!
    @IBOutlet weak var count: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
