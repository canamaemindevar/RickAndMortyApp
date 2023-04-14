//
//  MyExtensions.swift
//  RickAndMortyApp
//
//  Created by Emincan Antalyalı on 14.04.2023.
//

import UIKit


extension UILabel {

  func resizable() -> Self {
    translatesAutoresizingMaskIntoConstraints = false
    return self
  }

  func text(_ text: String) -> Self {
    self.text = text
    return self
  }

  func align(_ alignment: NSTextAlignment) -> Self {
    textAlignment = alignment
    return self
  }

  func font(_ font: UIFont) -> Self {
    self.font = font
    return self
  }

  func textColor(_ color: UIColor) -> Self {
    self.textColor = color
    return self
  }
    
}
