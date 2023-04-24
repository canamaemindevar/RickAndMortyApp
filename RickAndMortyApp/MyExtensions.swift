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

extension UIView {
    
    /// Set rounds raidusly
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
    }
}
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
       
        dateformat.dateFormat = format
       
        return dateformat.string(from: self)
    }
}

public extension IndexPath {

  func isLastRow(at tableView: UITableView) -> Bool {
    return row == (tableView.numberOfRows(inSection: section) - 1)
  }

  func isLastRow(at collectionView: UICollectionView) -> Bool {
    return row == (collectionView.numberOfItems(inSection: section) - 1)
  }
}
