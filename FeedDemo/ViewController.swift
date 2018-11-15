//
//  ViewController.swift
//  FeedDemo
//
//  Created by David Troupe on 11/14/18.
//  Copyright © 2018 David Troupe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  private let viewModel = FeedViewModel()
  @IBOutlet weak var layerView: UIView!
  
  private let data = ["Cat", "Dog", "Bird", "Rat"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addBackgroundGradient()
    viewModel.loadPosts()
    let nib = UINib.init(nibName: "BetterFeedCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "cell")
    tableView.backgroundColor = UIColor.clear
    tableView.separatorStyle = .none
    tableView.dataSource = self
    tableView.delegate = self
    tableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    tableView.reloadData()
  }
  
  private func addBackgroundGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame.size = view.frame.size
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.colors = [UIColor.pinkRed.cgColor, UIColor.tomatoTwo.cgColor]
    layerView.layer.addSublayer(gradientLayer)
    view.sendSubviewToBack(layerView)
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows(forSection: section)
    // return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BetterFeedCell
    cell.configure(from: viewModel.post(forIndexPath: indexPath))
    
    cell.replyTapAction = { [weak self] (UITableViewCell) in
      self?.viewModel.expandPost(at: indexPath.section)
      self?.tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
    }
    
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    cell.textLabel?.text = data[indexPath.row]
    
    // cell.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: cell.frame.size.height)

    // cell.layer.borderWidth = 1.0
    // cell.layer.borderColor = UIColor.black.cgColor
    // cell.layer.cornerRadius = 8
  
    return cell
  }
}

extension ViewController: UITableViewDelegate {}

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
