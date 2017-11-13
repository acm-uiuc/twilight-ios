//
//  NodeDetailCell.swift
//  twilight
//
//  Created by Rauhul Varma on 11/12/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

class NodeDetailCell: UITableViewCell {
    @IBOutlet weak var macAddressLabel: UILabel!
    @IBOutlet weak var ipAddressLabel:  UILabel!
    @IBOutlet weak var dateAddedLabel:  UILabel!

    @IBOutlet weak var indicatorView:   UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        indicatorView.layer.cornerRadius = 8
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        macAddressLabel.text = "Mac Address"
        ipAddressLabel.text  = "IP Address"
        dateAddedLabel.text  = "Date Added"
    }

    
}
