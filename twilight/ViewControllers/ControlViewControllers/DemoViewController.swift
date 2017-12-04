//
//  DemoViewController.swift
//  twilight
//
//  Created by Rauhul Varma on 12/4/17.
//  Copyright © 2017 acm. All rights reserved.
//

import Foundation
import UIKit

class DemoViewController: UIViewController {
    
    var redValue:   UInt8 = 0
    var greenValue: UInt8 = 0
    var blueValue:  UInt8 = 0

    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!

    @IBOutlet weak var launchButton: UIButton!
    var originalButtonColor: UIColor?
    
    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        launchButton.layer.cornerRadius = 4
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.white
    
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        launchButton.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: launchButton.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: launchButton.centerYAnchor).isActive = true
    }
    
    @IBAction func redSliderDidChangeValue(_ sender: UISlider) {
        redValue = UInt8(sender.value)
        redValueLabel.text = "\(redValue)"
    }
   
    @IBAction func greenSliderDidChangeValue(_ sender: UISlider) {
        greenValue = UInt8(sender.value)
        greenValueLabel.text = "\(greenValue)"
    }

    @IBAction func blueSliderDidChangeValue(_ sender: UISlider) {
        blueValue = UInt8(sender.value)
        blueValueLabel.text = "\(blueValue)"
    }

    
    @IBAction func sendCommand(_ sender: Any?) {
        launchButton.isEnabled = false
        launchButton.setTitle(nil, for: .normal)
        originalButtonColor = launchButton.backgroundColor
        launchButton.backgroundColor = UIColor.gray
        
        activityIndicator.startAnimating()
        
        DemoService.sendColor(r: redValue, g: greenValue, b: blueValue)
        .onSuccess { (data) in
            print(data)
            DispatchQueue.main.async {
                self.launchButton.isEnabled = true
                self.launchButton.backgroundColor = self.originalButtonColor
                self.launchButton.setTitle("Launch", for: .normal)
                self.activityIndicator.stopAnimating()
            }
        }
        .onFailure { (reason) in
            print(reason)
            DispatchQueue.main.async {
                self.launchButton.isEnabled = true
                self.launchButton.backgroundColor = self.originalButtonColor
                self.launchButton.setTitle("Launch", for: .normal)
                self.activityIndicator.stopAnimating()
            }
        }
        .perform(withAuthorization: nil)
    }
}
