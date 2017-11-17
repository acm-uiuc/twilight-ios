//
//  TwilightNode.swift
//  twilight
//
//  Created by Rauhul Varma on 11/13/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation

typealias TwilightNodeContained = GrootReturnDataContainer<TwilightNode>

class TwilightNode: Codable {

    enum CodingKeys: String, CodingKey {
        case macAddress = "mac_address"
        case ipAddress = "ip_address"
        case dateAdded = "date_added"
    }

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()

    var macAddress: String
    var ipAddress:  String
    var dateAdded:  Date

    var dateString: String {
        return dateFormatter.string(from: dateAdded)
    }

    init() {
        macAddress = "00:00:00:00:00:00"
        ipAddress  = "000.000.000.000"
        dateAdded = Date()
    }
}
