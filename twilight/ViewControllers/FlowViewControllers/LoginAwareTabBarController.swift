//
//  LoginAwareTabBarController.swift
//  twilight
//
//  Created by Rauhul Varma on 11/11/17.
//  Copyright © 2017 acm. All rights reserved.
//

import UIKit

class LoginAwareTabBarController: UITabBarController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if LoginController.shared.currentUser == nil {
            performSegue(withIdentifier: "ShowLoginViewController", sender: nil)
        }
    }

    func logout() {
        LoginController.shared.currentUser = nil
        performSegue(withIdentifier: "ShowLoginViewController", sender: nil)
        selectedIndex = 0
    }



}
