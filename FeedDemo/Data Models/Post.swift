//
//  Post.swift
//  FeedDemo
//
//  Created by David Troupe on 11/14/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import UIKit

struct Post {
  
  let image: UIImage?
  let userName: String
  let postText: String
  var comments: [Post]
  
  var isComment: Bool
  var isExpanded: Bool = false
  
  init(userName: String, postText: String, comments: [Post], isComment: Bool) {
    self.userName = userName
    self.postText = postText
    self.comments = comments
    self.isComment = isComment
    self.image = UIImage(named: "UserIcon")
  }
}
