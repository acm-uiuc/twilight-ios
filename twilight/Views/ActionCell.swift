//
//  ActionCell.swift
//  twilight
//
//  Created by Rauhul Varma on 11/12/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

protocol ActionCellDelegate {
    func didPerformAction(atIndexPath indexPath: IndexPath)
}

class ActionCell: UITableViewCell {
    static let REUSE_IDENTIFIER = "ActionCell"

    var indexPath: IndexPath?
    var delegate: ActionCellDelegate?

    @IBOutlet weak var fieldLabel:   UILabel!
    @IBOutlet weak var actionButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        actionButton.layer.cornerRadius = 4
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        indexPath = nil
        delegate  = nil

        fieldLabel.text = "Field"
        actionButton.setTitle("Action", for: .normal)
    }

    @IBAction func didPerformAction(sender: Any?) {
        guard let indexPath = indexPath else { return }
        delegate?.didPerformAction(atIndexPath: indexPath)
    }
}
