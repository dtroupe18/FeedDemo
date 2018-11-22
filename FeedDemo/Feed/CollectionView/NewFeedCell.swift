//
//  NewFeedCell.swift
//  FeedDemo
//
//  Created by David Troupe on 11/19/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import UIKit

class NewFeedCell: UICollectionViewCell {
  
  @IBOutlet weak var leftIndentationConstraint: NSLayoutConstraint!
  private var originalLeftIndentation: CGFloat?
  
  @IBOutlet weak var invisibleBackgroundView: UIView!
  @IBOutlet weak var visibleBackgroundView: UIView!
  
  
  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  
  @IBOutlet weak var lineView: UIView!
  
  @IBOutlet weak var buttonStackView: UIStackView!
  @IBOutlet weak var cheerButton: UIButton!
  @IBOutlet weak var replyButoon: UIButton!
  
  @IBOutlet weak var postTextLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = UIColor.clear
    invisibleBackgroundView.backgroundColor = UIColor.clear
    visibleBackgroundView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.95)
    visibleBackgroundView.layer.cornerRadius = 8
    
    userImageView.layer.cornerRadius = userImageView.frame.width/2
    userImageView.clipsToBounds = true
    originalLeftIndentation = leftIndentationConstraint.constant
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
  
  @IBAction func replyPressed(_ sender: Any) {
    print("reply pressed")
  }
  
  @IBAction func cheerPressed(_ sender: Any) {
    print("Cheer pressed")
  }
  
  
}
