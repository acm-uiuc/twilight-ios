//
//  TwilightNodeDatasource.swift
//  twilight
//
//  Created by Rauhul Varma on 11/13/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

class TwilightNodeDatasource: NSObject, UITableViewDataSource {
    typealias Model = TwilightNode

    var data = [[TwilightNode]]()

    override init() {
        super.init()
        data = [[TwilightNode(), TwilightNode(), TwilightNode()]]
    }

    func modelForItem(at indexPath: IndexPath) -> Model {
        return data[indexPath.section][indexPath.item]
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NodeDetailCell.REUSE_IDENTIFIER, for: indexPath)
        (cell as? NodeDetailCell) <- modelForItem(at: indexPath)
        return cell
    }

}
