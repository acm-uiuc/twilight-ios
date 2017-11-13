//
//  SwitchCell.swift
//  twilight
//
//  Created by Rauhul Varma on 11/13/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

protocol SwitchCellDelegate {
    func didSwitch(toValue value: Bool, atIndexPath indexPath: IndexPath)
}

class SwitchCell: UITableViewCell {

    var indexPath: IndexPath?
    var delegate: SwitchCellDelegate?

    @IBOutlet weak var fieldLabel:   UILabel!
    @IBOutlet weak var actionSwitch: UISwitch!

    override func prepareForReuse() {
        super.prepareForReuse()

        indexPath = nil
        delegate  = nil

        fieldLabel.text = "Field"
        actionSwitch.setOn(false, animated: false)
    }

    @IBAction func didPerformAction(sender: Any?) {
        guard let indexPath = indexPath, let sender = sender as? UISwitch else { return }
        delegate?.didSwitch(toValue: sender.isSelected, atIndexPath: indexPath)
    }
}

