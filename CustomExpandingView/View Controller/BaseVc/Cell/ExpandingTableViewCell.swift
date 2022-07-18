//
//  ExpandingTableViewCell.swift
//  CustomExpandingView
//
//  Created by Nandini Joshi on 03/06/22.
//

import UIKit

class ExpandingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subTitleLabel: UILabel!

    var subTitleString: String = "" {
        didSet {
            self.subTitleLabel.text = subTitleString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
