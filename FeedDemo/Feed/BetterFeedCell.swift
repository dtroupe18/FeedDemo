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
  @IBOutlet weak var visibleBackgroundView: UIView!
  @IBOutlet weak var leftIndentationConstraint: NSLayoutConstraint!
  var originalLeftIndentation: CGFloat?
  
  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var postTextLabel: UILabel!
  
  @IBOutlet weak var cheerButton: UIButton!
  @IBOutlet weak var replyButton: UIButton!
  
  var replyTapAction: ((UITableViewCell) -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.backgroundColor = UIColor.clear
    self.selectionStyle = .none
    invisibleBackgroundView.backgroundColor = UIColor.clear
    visibleBackgroundView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.95)
    visibleBackgroundView.layer.cornerRadius = 8
    
    // Need to add another view to create the border
    //
    // visibleBackgroundView.layer.borderWidth = 1
    // visibleBackgroundView.layer.borderColor = UIColor.black.cgColor
    
    // visibleBackgroundView.defaultShadow()
    
    userImageView.layer.cornerRadius = userImageView.frame.width/2
    userImageView.clipsToBounds = true
    originalLeftIndentation = leftIndentationConstraint.constant
    
    // visibleBackgroundView.bringSubviewToFront(userImageView)
    
  }
  
  @IBAction func replyTapped(_ sender: Any) {
    if sender is UIButton {
      replyTapAction?(self)
    }
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func configure(from post: Post) {
    self.userImageView.image = post.image
    self.usernameLabel.text = post.userName
    self.postTextLabel.text = post.postText
    
    if post.isComment {
      leftIndentationConstraint.constant += 20
    }
  }
  
  override func prepareForReuse() {
    if let baseIndentation = originalLeftIndentation {
      leftIndentationConstraint.constant = baseIndentation
    }
  }
  
}
