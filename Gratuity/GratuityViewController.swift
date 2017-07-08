//
//  ViewController.swift
//  Gratuity
//
//  Created by Danny Garcia on 7/7/17.
//  Copyright © 2017 Danny Garcia. All rights reserved.
//

import UIKit

class GratuityViewController: UIViewController {
  
  @IBOutlet weak var billAmt: UITextField!
  @IBOutlet weak var gratuityAmt: UILabel!
  @IBOutlet weak var totalAmt: UILabel!
  @IBOutlet weak var gratuityControl: UISegmentedControl!
  
  let defaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let defaultGratuity = defaults.object(forKey: "defaultGratuityIndex") {
      gratuityControl.selectedSegmentIndex = defaultGratuity as! Int
    }
    defaults.addObserver(self, forKeyPath: "defaultGratuityIndex", options: .new, context: nil)
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "defaultGratuityIndex" {
      gratuityControl.selectedSegmentIndex = defaults.integer(forKey: "defaultGratuityIndex")
      calculateGratuity()
    }
  }
  
  deinit {
    defaults.removeObserver(self, forKeyPath: "defaultGratuityIndex")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func dismissKeyboardOnTap(_ sender: Any) {
    view.endEditing(true)
  }
  
  @IBAction func calculateGratuity() {
    let gratuityPercentages = [0.18, 0.20, 0.25]
    
    let bill = Double(billAmt.text!) ?? 0
    let gratuity = bill * gratuityPercentages[gratuityControl.selectedSegmentIndex]
    let total = bill + gratuity
    
    gratuityAmt.text = String(format: "$%.2f", gratuity)
    totalAmt.text = String(format: "$%.2f", total)
  }
}

