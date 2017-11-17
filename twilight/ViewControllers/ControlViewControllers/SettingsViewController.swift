//
//  SettingsViewController.swift
//  twilight
//
//  Created by Rauhul Varma on 11/12/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ActionCellDelegate {


    let datasoruce: [CellType] = [
        .name,
        .netID,
        .logout
    ]

    enum CellType {
        case name
        case netID
        case logout
    }

    // MARK: - UIViewController


    // MARK: - UITableViewDelegate


    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasoruce.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = datasoruce[indexPath.row]
        let cell: UITableViewCell

        switch type {
        case .name:
            cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.REUSE_IDENTIFIER, for: indexPath)
            if let cell = cell as? InfoCell, let user = LoginController.shared.currentUser {
                cell.fieldLabel.text = "User"
                cell.responseLabel.text = "\(user.firstName.capitalized) \(user.lastName.capitalized)"
            }
        case .netID:
            cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.REUSE_IDENTIFIER, for: indexPath)
            if let cell = cell as? InfoCell, let user = LoginController.shared.currentUser {
                cell.fieldLabel.text = "NetID"
                cell.responseLabel.text = "\(user.netID.lowercased())"
            }
        case .logout:
            cell = tableView.dequeueReusableCell(withIdentifier: ActionCell.REUSE_IDENTIFIER, for: indexPath)
            if let cell = cell as? ActionCell {
                cell.indexPath = indexPath
                cell.delegate = self
                cell.fieldLabel.text = "Exit"
                cell.actionButton.setTitle("Logout", for: .normal)
            }
        }

        return cell
    }

    // MARK: - ActionCellDelegate
    func didPerformAction(atIndexPath indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Logout", message: "Are you sure?", preferredStyle: .alert)
        alertController.addAction(
            UIAlertAction(title: "Yes", style: .default) { (_) in
                (self.tabBarController as? LoginAwareTabBarController)?.logout()
            }
        )
        alertController.addAction(
            UIAlertAction(title: "No", style: .cancel, handler: nil)
        )
        present(alertController, animated: true, completion: nil)
    }

}
