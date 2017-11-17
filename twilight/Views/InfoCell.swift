//
//  InfoCell.swift
//  twilight
//
//  Created by Rauhul Varma on 11/12/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

class InfoCell: UITableViewCell {
    static let REUSE_IDENTIFIER = "InfoCell"

    @IBOutlet weak var fieldLabel:    UILabel!
    @IBOutlet weak var responseLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        fieldLabel.text    = "Field"
        responseLabel.text = "Response"
    }


}
