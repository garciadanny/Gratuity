//
//  UITheme.swift
//  Gratuity
//
//  Created by Danny Garcia on 7/11/17.
//  Copyright © 2017 Danny Garcia. All rights reserved.
//

import UIKit

struct UITheme {
  static let systemDefaultTintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1)
  
  static func toggle(for view: UIView) {
    let isDarkTheme = UserDefaults.standard.bool(forKey: "defaultToDarkTheme")
    
    if isDarkTheme {
      setDarkTheme(for: view)
    } else {
      setDefaultTheme(for: view)
    }
  }
  
  private static func setDarkTheme(for view: UIView) {
    view.backgroundColor = UIColor.darkGray
    view.tintColor = UIColor.white
    
    let viewAttributes = subviews(in: view)
    viewAttributes.labels.forEach { $0.textColor = UIColor.white }
    viewAttributes.textFields.forEach { (field) in
      field.backgroundColor = UIColor.darkGray
      field.textColor = UIColor.white
    }
  }
  
  private static func setDefaultTheme(for view: UIView) {
    view.backgroundColor = UIColor.white
    view.tintColor = systemDefaultTintColor
    
    let viewAttributes = subviews(in: view)
    viewAttributes.labels.forEach { $0.textColor = UIColor.black }
    viewAttributes.textFields.forEach { (field) in
      field.backgroundColor = UIColor.white
      field.textColor = UIColor.black
    }
  }

  private static func subviews(in view: UIView) -> (labels: [UILabel], textFields: [UITextField]) {
    var labels = [UILabel]()
    var textFields = [UITextField]()
    
    view.subviews.forEach { (subview) in
      if let textField = subview as? UITextField {
        textFields += [textField]
      } else if let labelView = subview as? UILabel {
        labels += [labelView]
      } else {
        labels += subviews(in: subview).labels
        textFields += subviews(in: subview).textFields
      }
    }
    return (labels: labels, textFields: textFields)
  }
}
