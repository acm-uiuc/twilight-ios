//
//  SystemStatusViewController.swift
//  twilight
//
//  Created by Rauhul Varma on 11/12/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

class SystemStatusViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let nodes = TwilightNodeDatasource()

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nodes
    }

    // MARK: - UITableViewDelegate


}
