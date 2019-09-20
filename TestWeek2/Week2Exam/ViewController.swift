//
//  ViewController.swift
//  Week2Exam
//
//  Created by Sharan on 9/20/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dictionary:[String: Any] = [:]
    var ActualURL : String = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes"
    var dictionaryKeys:[String]{
    return Array(dictionary.keys.sorted())
    }
    
    
    @IBOutlet weak var FirstView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstView.dataSource = self
        FirstView.delegate = self
        
        guard let url = URL(string: ActualURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let GameOfThrones = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {return}
            self.dictionary = GameOfThrones
            DispatchQueue.main.async {
                print(self.dictionaryKeys)
                self.FirstView.reloadData()
            }
        }.resume()
        
    }


}

extension ViewController: UITableViewDataSource{
  public  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
       let key = dictionaryKeys[indexPath.row]
        let keyValue = dictionary[key]
        cell.textLabel?.text = dictionaryKeys[indexPath.row]
    if keyValue is String {
        cell.detailTextLabel?.text = keyValue as? String
    } else if keyValue == nil {
        cell.detailTextLabel?.text = nil
    }
    
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let value = self.dictionaryKeys
        print(value)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "ThisView") as? ViewController else { return }
        navigationController?.pushViewController( nextViewController, animated: true)
    }
}
