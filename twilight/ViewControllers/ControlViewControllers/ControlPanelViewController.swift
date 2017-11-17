//
//  ControlPanelViewController.swift
//  twilight
//
//  Created by Rauhul Varma on 11/12/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

class ControlPanelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!

    let refreshControl = UIRefreshControl()
//    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.refreshControl = refreshControl

//        searchController.searchBar.delegate = self
//        searchController.dimsBackgroundDuringPresentation = false
//        navigationItem.searchController = searchController
    }

    // MARK: - Refresh
    @objc func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "System"
        case 1:
            return "Animations"
        default:
            return nil
        }
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?

        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.REUSE_IDENTIFIER, for: indexPath)
            if let cell = cell as? SwitchCell {
                cell.fieldLabel.text = "Power"
                cell.actionSwitch.setOn(true, animated: false)
            }

        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: ActionCell.REUSE_IDENTIFIER, for: indexPath)
            if let cell = cell as? ActionCell {
                cell.fieldLabel.text = "Rain Animation"
                cell.actionButton.setTitle("Launch", for: .normal)
            }

        default:
            break
        }

        return cell ?? UITableViewCell()
    }


}
