//
//  LoginViewController.swift
//  twilight
//
//  Created by Rauhul Varma on 11/11/17.
//  Copyright © 2017 acm. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var netIDField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()

        netIDField.text = nil
        passwordField.text = nil

        loginButton.isEnabled = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterForKeyboardNotifications()
    }


    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == netIDField {
            passwordField?.becomeFirstResponder()
        } else {
            passwordField?.resignFirstResponder()
            login(sender: nil)
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layoutIfNeeded()
    }

    // MARK: - Keyboard
    override func keyboardWillShow(_ notification: NSNotification) {
        super.keyboardWillShow(notification)

        animateWithKeyboardLayout(notification: notification) { (keyboardRect) in
            self.bottomLayoutConstraint.constant = keyboardRect.height
        }
    }

    override func keyboardWillHide(_ notification: NSNotification) {
        super.keyboardWillHide(notification)

        animateWithKeyboardLayout(notification: notification) { (keyboardRect) in
            self.bottomLayoutConstraint.constant = 0
        }
    }

    // MARK: - Editing
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func login(sender: Any?) {
        let netID = netIDField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard netID != "" && password != "" else {
            presentErrorController(title: "Incomplete", dismissParentOnCompletion: false)
            return
        }

        view.endEditing(true)

        loginButton.isEnabled = false
        loginButton.alpha     = 0.5

        GrootUsersService.loginUser(byNetID: netID, andPassword: password)
        .onSuccess { (userContainer) in
            if let user = userContainer.data {
                LoginController.shared.currentUser = user
                self.dismiss(animated: true, completion: nil)
            } else {
                let reason = userContainer.error ?? "Unknown error occured. Try again later."
                DispatchQueue.main.async {
                    self.presentErrorController(title: "Error", message: reason, dismissParentOnCompletion: false)
                    self.loginButton.isEnabled = true
                    self.loginButton.alpha     = 1.0
                }
            }
        }
        .onFailure { (reason) in
            DispatchQueue.main.async {
                self.presentErrorController(title: "Error", message: reason, dismissParentOnCompletion: false)
                self.loginButton.isEnabled = true
                self.loginButton.alpha     = 1.0
            }
        }
        .perform(withAuthorization: nil)
    }


}

