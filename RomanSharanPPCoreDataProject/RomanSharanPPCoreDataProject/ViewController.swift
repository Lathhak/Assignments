//
//  ViewController.swift
//  RomanSharanPPCoreDataProject
//
//  Created by MAC on 9/23/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var colorList: [String] = ["Red", "Green", "Yellow", "Purple", "Brown"]
  var favoriteColorList: [String] = []
  @IBOutlet weak var justATableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if UserDefaults.standard.array(forKey: "Favourites")?.isEmpty == false {
        
    favoriteColorList = UserDefaults.standard.array(forKey: "Favourites") as! [String]
        print(favoriteColorList)
    } else {
        print("Empty ")
    }
    
    justATableView.dataSource = self
    justATableView.delegate = self
  }
  func addToFavorites(index: Int){
    if (!favoriteColorList.contains(colorList[index])){
      favoriteColorList.append(colorList[index])}
    UserDefaults.standard.set(favoriteColorList, forKey: "Favourites")
  }
  
  func removeFromFavorites(index: Int){
    favoriteColorList.remove(at: index)
    UserDefaults.standard.set(favoriteColorList, forKey: "Favourites")
    
  }

    func storeColor(){
        UserDefaults.standard.set(favoriteColorList, forKey: "Favourites")
    }
}

extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return colorList.count}
    else {return favoriteColorList.count}
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
    if section == 0{
      return "List of Colors"
    } else {
      return "List of Favorites"
    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
    if indexPath.section == 0 {
      cell.textLabel?.text = colorList[indexPath.row]
      
    } else {
      cell.textLabel?.text = favoriteColorList[indexPath.row]
    }
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  
}

extension ViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 0 {
    addToFavorites(index: indexPath.row)
        
    } else {
      removeFromFavorites(index: indexPath.row)
    }
    print(favoriteColorList)
    justATableView.reloadData()
    
  }
    
}
