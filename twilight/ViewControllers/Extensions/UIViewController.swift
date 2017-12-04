//
//  UIViewController.swift
//  twilight
//
//  Created by Rauhul Varma on 11/11/17.
//  Copyright © 2017 acm. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentErrorController(title: String, message: String? = nil, dismissParentOnCompletion exit: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "Ok", style: .default) { (_) in
                if exit {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        )
        present(alert, animated: true, completion: nil)
    }
    
    //
    // MARK: Keyboard Layout
    //

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {

    }

    @objc func keyboardWillHide(_ notification: NSNotification) {

    }

    func animateWithKeyboardLayout(notification: NSNotification, layout: ((CGRect) -> Void)?) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double,
            let curveValue = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int,
            let curve = UIViewAnimationCurve(rawValue: curveValue),
            let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardFrame = keyboardFrameValue.cgRectValue

        layout?(keyboardFrame)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(duration)
        UIView.setAnimationCurve(curve)
        view.layoutIfNeeded()
        UIView.commitAnimations()
    }

    
}
