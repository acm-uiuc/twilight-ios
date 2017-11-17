//
//  CellLoading.swift
//  twilight
//
//  Created by Rauhul Varma on 11/13/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation

infix operator <-
func <- (left: NodeDetailCell?, right: TwilightNode?) {
    guard let cell = left, let model = right else { return }
    cell.macAddressLabel.text = model.macAddress
    cell.ipAddressLabel.text  = model.ipAddress
    cell.dateAddedLabel.text  = model.dateString
}
