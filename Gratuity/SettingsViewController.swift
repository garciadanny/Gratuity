//
//  SettingsViewController.swift
//  Gratuity
//
//  Created by Danny Garcia on 7/8/17.
//  Copyright © 2017 Danny Garcia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  let defaults = UserDefaults.standard
  
  @IBOutlet weak var defaultGratuityControl: UISegmentedControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if let defaultGratuity = defaults.object(forKey: "defaultGratuityIndex") {
      defaultGratuityControl.selectedSegmentIndex = defaultGratuity as! Int
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func setDefaultGratuity() {
    defaults.set(defaultGratuityControl.selectedSegmentIndex, forKey: "defaultGratuityIndex")
    defaults.synchronize()
  }
}
