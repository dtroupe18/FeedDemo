//
//  FeedViewModel.swift
//  FeedDemo
//
//  Created by David Troupe on 11/14/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import Foundation

class FeedViewModel {
  
  var posts = [Post]()
  
  func loadPosts() {
    let one = Post(userName: "LAXRunner", postText: "Cupcake ipsum dolor sit. Amet jelly pastry lollipop croissant wafer lemon drops cake. Donut caramels bonbon chupa chups sesame snaps bear claw croissant")
    posts.append(one)
  }
  
  func numberOfRows() -> Int {
    return posts.count
  }
  
  func post(forIndexPath indexPath: IndexPath) -> Post {
    return posts[indexPath.row]
  }
}
