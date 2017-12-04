//
//  DemoService.swift
//  twilight
//
//  Created by Rauhul Varma on 12/4/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import APIManager



class DemoService: APIService {
    open class var baseURL: String {
        return "http://192.168.1.182:5000"
    }
    
    open class var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/json",
        ]
    }

    class func sendColor(r: UInt8, g: UInt8, b: UInt8) -> APIRequest<DemoService, Data> {
        return APIRequest<DemoService, Data>(endpoint: "/color", params: ["r": "\(r)", "g": "\(g)", "b": "\(b)"], method: .GET)
    }

}

extension Data: APIReturnable {
    public init(from data: Data) throws {
        self = data
    }
}
