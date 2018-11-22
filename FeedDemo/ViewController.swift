//
//  ViewController.swift
//  FeedDemo
//
//  Created by David Troupe on 11/14/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!

  private let viewModel = FeedViewModel()
  @IBOutlet weak var layerView: UIView!
  
  private let data = ["Cat", "Dog", "Bird", "Rat"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // addBackgroundGradient()
    viewModel.loadPosts()
    // let nib = UINib.init(nibName: "NewFeedCell", bundle: nil)
    // collectionView.register(nib, forCellWithReuseIdentifier: "NewFeedCell")
    
    let nib = UINib.init(nibName: "TestCell", bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    
    if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: 200)
    }
    
    collectionView.backgroundColor = UIColor.clear
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    collectionView.reloadData()
  }

  private func addBackgroundGradient() {
    let collectionViewBackgroundView = UIView()
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame.size = view.frame.size
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.colors = [UIColor.pinkRed.cgColor, UIColor.tomatoTwo.cgColor]
    collectionView.backgroundView = collectionViewBackgroundView
    collectionView.backgroundView?.layer.addSublayer(gradientLayer)
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("SelectedItem at: \(indexPath)")
  }
}

extension ViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    print("qwe - numberOfSections: \(viewModel.numberOfSections())")
    return viewModel.numberOfSections()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("qwe - numberOfRows in section \(section): \(viewModel.numberOfRows(forSection: section))")
    return viewModel.numberOfRows(forSection: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TestCollectionViewCell
    // cell.configure(from: viewModel.post(forIndexPath: indexPath))
    
//    cell.replyTapAction = { [weak self] (UICollectionViewCell) in
//      print("qwe - replyTapped!")
//      self?.viewModel.expandPost(at: indexPath.section)
//      self?.collectionView.reloadSections(IndexSet(integer: indexPath.section))
//    }
    
    print("qwe - Cell.width: \(cell.frame.width)")
    print("qwe - Cell.height: \(cell.frame.height)")
    
    // print("qwe - postTextLabel.intrinsicContentSize.height: \(cell.postTextLabel.intrinsicContentSize.height)")
    
    return cell
  }
  

  
  
}

//extension ViewController: UITableViewDataSource {
//  func numberOfSections(in tableView: UITableView) -> Int {
//
//  }
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    // return data.count
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BetterFeedCell
//    cell.configure(from: viewModel.post(forIndexPath: indexPath))
//
//    cell.replyTapAction = { [weak self] (UITableViewCell) in
//      self?.viewModel.expandPost(at: indexPath.section)
//      self?.tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
//    }
//
////    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
////    cell.textLabel?.text = data[indexPath.row]
//
//    // cell.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: cell.frame.size.height)
//
//    // cell.layer.borderWidth = 1.0
//    // cell.layer.borderColor = UIColor.black.cgColor
//    // cell.layer.cornerRadius = 8
//
//    return cell
//  }
//}
//
//extension ViewController: UITableViewDelegate {}

extension UIColor {
  static let pinkRed: UIColor = {
    UIColor(red: 255.0 / 255.0, green: 0.0, blue: 102.0 / 255.0, alpha: 1.0)
  }()
  
  static let tomatoTwo: UIColor = {
    UIColor(red: 241.0 / 255.0, green: 90.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0)
  }()
  
  static let darkGray74: UIColor = {
    UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 0.95)
  }()
  
  static let white95Alpha: UIColor = {
    UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.95)
  }()
}
