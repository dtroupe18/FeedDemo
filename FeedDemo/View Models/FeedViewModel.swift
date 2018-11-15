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
    let firstComment = Post(userName: "LAXRunner", postText: "This is super awesome reply text lorem ipsum stuff stuff.  Replying to a thread.  Single thread, not multi-thread.  10/10 boutique fitness for the win. Best thing ever.", comments: [], isComment: true)
    let secondComment = Post(userName: "LAXRunner", postText: "Second comment!", comments: [], isComment: true)
    
    
    let firstPost = Post(userName: "LAXRunner", postText: "Cupcake ipsum dolor sit. Amet jelly pastry lollipop croissant wafer lemon drops cake. Donut caramels bonbon chupa chups sesame snaps bear claw croissant", comments: [firstComment, secondComment], isComment: false)
  
    let x = Post(userName: "Beavis", postText: "LAXRunner is a cheater!", comments: [], isComment: true)
    let y = Post(userName: "Butt-Head", postText: "yeah LAXRunner is a fucking cheater!", comments: [], isComment: true)
    
    let secondPost = Post(userName: "LAXRunner", postText: "I Just Earned 655 Fitcoin Taking Justin Koodish 0 to 5k Wk 6 Day 2… Take Workout", comments: [x, y], isComment: false)
    
    posts.append(firstPost)
    posts.append(secondPost)
  }
  
  func numberOfSections() -> Int {
    return posts.count
  }
  
  func numberOfRows(forSection section: Int) -> Int {
    let sectionPost = posts[section]
    if sectionPost.isExpanded {
      print("section: \(section) has \(sectionPost.comments.count) rows")
      return sectionPost.comments.count + 1
    } else {
      return 1
    }
  }
  
  func post(forIndexPath indexPath: IndexPath) -> Post {
    let sectionPost = posts[indexPath.section]
    if sectionPost.isExpanded && indexPath.row != 0 {
      print("post(forIndexPath expanded: \(indexPath)")
      return sectionPost.comments[indexPath.row - 1]
    } else {
      return sectionPost
    }
  }
  
  func expandPost(at index: Int) {
    posts[index].isExpanded = true
  }
}
