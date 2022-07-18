//
//  UITableViewCell+Extension.swift
//  CustomExpandingView
//
//  Created by Nandini Joshi on 03/06/22.
//

import UIKit

extension UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
}

extension UITableViewHeaderFooterView {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
}
