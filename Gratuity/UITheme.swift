//
//  UITheme.swift
//  Gratuity
//
//  Created by Danny Garcia on 7/11/17.
//  Copyright © 2017 Danny Garcia. All rights reserved.
//

import UIKit

struct UITheme {
  static let defaults = UserDefaults.standard
  static let systemDefaultTintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
  
  static func toggle(for view: UIView) {
    let isDarkTheme = defaults.bool(forKey: "defaultToDarkTheme")
    
    if isDarkTheme {
      view.backgroundColor = UIColor.darkGray
      view.tintColor = UIColor.white
      textLables(in: view).forEach { $0.textColor = UIColor.white }
    } else {
      view.backgroundColor = UIColor.white
      view.tintColor = systemDefaultTintColor
      textLables(in: view).forEach { $0.textColor = UIColor.black }
    }
  }

  private static func textLables(in view: UIView) -> [UILabel] {
    var labels = [UILabel]()
    
    view.subviews.forEach { (subview) in
      if let labelView = subview as? UILabel {
        labels += [labelView]
      } else {
        labels += textLables(in: subview)
      }
    }
    return labels
  }
}
