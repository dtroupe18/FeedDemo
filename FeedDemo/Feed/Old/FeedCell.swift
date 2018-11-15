//
//  FeedCell.swift
//  FeedDemo
//
//  Created by David Troupe on 11/14/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
  
  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var postTextLabel: UILabel!
  
  @IBOutlet weak var buttonStackView: UIStackView!
  @IBOutlet weak var cheerButton: UIButton!
  @IBOutlet weak var replyButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
  func configure(from post: Post) {
    configureCellAppearance()
    self.userImageView.image = post.image
    self.userNameLabel.text = post.userName
    self.postTextLabel.text = post.postText
  }
  
  func configureCellAppearance() {
    backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    layer.cornerRadius = 12
    userImageView.layer.cornerRadius = userImageView.frame.width/2
    userImageView.clipsToBounds = true
    
    layer.cornerRadius = 8
    layer.masksToBounds = true
  }
  
}
