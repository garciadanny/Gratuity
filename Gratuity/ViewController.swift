//
//  ViewController.swift
//  Gratuity
//
//  Created by Danny Garcia on 7/7/17.
//  Copyright © 2017 Danny Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var billAmt: UITextField!
  @IBOutlet weak var gratuityAmt: UILabel!
  @IBOutlet weak var totalAmt: UILabel!
  @IBOutlet weak var gratuityControl: UISegmentedControl!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
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

