//
//  SearchTableViewCell.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/22/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var codeAbbreviationLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
