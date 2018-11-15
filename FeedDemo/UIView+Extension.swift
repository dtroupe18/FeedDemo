//
//  UIView+Extension.swift
//  FeedDemo
//
//  Created by David Troupe on 11/15/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import UIKit

extension UIView {
  func defaultShadow() {
    layer.shadowOpacity = 1.0
    layer.shadowRadius = 0.0
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: -1.0)
  }
}
