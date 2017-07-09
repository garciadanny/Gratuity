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
  let gratuityPercentages = [0.18, 0.20, 0.25]
  let sessionDataTimeLimit: Double = 600
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setPreviousSessionData()
    defaults.addObserver(self, forKeyPath: "defaultGratuityIndex", options: .new, context: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func dismissKeyboardOnTap(_ sender: Any) {
    view.endEditing(true)
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
 
  @IBAction func calculateGratuity() {
    let bill = Double(billAmt.text!) ?? 0
    let gratuity = bill * gratuityPercentages[gratuityControl.selectedSegmentIndex]
    let total = bill + gratuity
    
    gratuityAmt.text = String(format: "$%.2f", gratuity)
    totalAmt.text = String(format: "$%.2f", total)
    
    defaults.set(bill, forKey: "storedBillAmt")
  }
  
  func setPreviousSessionData() {
    if let defaultGratuity = defaults.object(forKey: "defaultGratuityIndex") {
      gratuityControl.selectedSegmentIndex = defaultGratuity as! Int
    }
    
    if let previousSession = defaults.object(forKey: "previousSessionDate") as? Date {
      let currentSession = Date()
      if currentSession.timeIntervalSince(previousSession) < sessionDataTimeLimit {
        billAmt.text = defaults.string(forKey: "storedBillAmt")
      }
    }
  }
}

