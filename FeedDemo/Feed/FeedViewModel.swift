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
    let firstComment = Post(userName: "LAXRunner", postText: "This is super awesome reply text lorem ipsum stuff stuff.  Replying to a thread.  Single thread, not multi-thread.  10/10 boutique fitness for the win. Best thing ever.", comments: [])
    let secondComment = Post(userName: "LAXRunner", postText: "This is super awesome reply text lorem ipsum stuff stuff.  Replying to a thread.  Single thread, not multi-thread.  10/10 boutique fitness for the win. Best thing ever.", comments: [])
    
    
    let firstPost = Post(userName: "LAXRunner", postText: "Cupcake ipsum dolor sit. Amet jelly pastry lollipop croissant wafer lemon drops cake. Donut caramels bonbon chupa chups sesame snaps bear claw croissant", comments: [firstComment, secondComment])
    
    let secondPost = Post(userName: "LAXRunner", postText: "I Just Earned 655 Fitcoin Taking Justin Koodish 0 to 5k Wk 6 Day 2… Take Workout", comments: [])
    
    
    posts.append(firstPost)
    posts.append(secondPost)
  }
  
  func numberOfRows() -> Int {
    return posts.count
  }
  
  func post(forIndexPath indexPath: IndexPath) -> Post {
    return posts[indexPath.row]
  }
}
