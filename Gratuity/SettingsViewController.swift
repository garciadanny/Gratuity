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
  @IBOutlet weak var uiThemeToggle: UISwitch!
  @IBOutlet weak var defaultGratuityLabel: UILabel!
  @IBOutlet weak var themeLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let defaultToDarkTheme = defaults.bool(forKey: "defaultToDarkTheme")
    uiThemeToggle.setOn(defaultToDarkTheme, animated: false)
    UITheme.toggle(for: view)
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
 
  @IBAction func toggleUITheme() {
    let isDarkTheme = uiThemeToggle.isOn
    defaults.set(isDarkTheme, forKey: "defaultToDarkTheme")
    UITheme.toggle(for: view)
  }
}
