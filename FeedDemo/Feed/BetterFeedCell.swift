//
//  BetterFeedCell.swift
//  FeedDemo
//
//  Created by David Troupe on 11/14/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import UIKit

class BetterFeedCell: UITableViewCell {
  
  @IBOutlet weak var invisibleBackgroundView: UIView!
  @IBOutlet weak var leftIndentationConstraint: NSLayoutConstraint!
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
