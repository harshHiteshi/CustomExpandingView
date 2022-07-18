//
//  ExpandableTableViewHeaderCell.swift
//  CustomExpandingView
//
//  Created by Nandini Joshi on 03/06/22.
//

import UIKit

class ExpandableTableViewHeaderCell: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextImageView: UIImageView!
    
    var sectionIndex: Int = 0
    var headerBlock: ((Int)-> ())?

    var headerModel: ExpandModel = ExpandModel.init() {
        didSet {
            self.titleLabel.text = headerModel.titleString
            self.nextImageView.image = headerModel.isExpanded ? UIImage.init(systemName: "chevron.down") : UIImage.init(systemName: "chevron.right")
        }
    }
    
    @IBAction func headerViewTapped(sender: UIButton) {
        if let headerBlock = headerBlock {
            headerBlock(sectionIndex)
        }
    }
}
