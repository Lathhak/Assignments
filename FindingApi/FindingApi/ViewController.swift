//
//  ViewController.swift
//  FindingApi
//
//  Created by Sharan on 9/18/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dictionary : [String: Any] = [:]
    var URLdictionary: String =  "https://pokeapi.co/api/v2"
    
    var dictionarKeys:[String]{
        return Array(dictionary.keys.sorted())
    }
    
        @IBOutlet weak var ThisTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThisTableView.dataSource = self
        ThisTableView.delegate = self
        
        guard let url = URL(string: URLdictionary) else {return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let pokemon = try? JSONSerialization.jsonObject(with: data, options:[]) as? [String: Any]    else {
                return
            }
            self.dictionary = pokemon
            DispatchQueue.main.async {
                self.ThisTableView.reloadData()
            }
            
            
            
        }.resume()
    }


}



extension ViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    //    var keys = Array(dictionary.keys.sorted())
        let key = dictionarKeys[indexPath.row]
        let keyValue = dictionary[key]
        
        cell.textLabel?.text = dictionarKeys[indexPath.row]
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let key = dictionarKeys[indexPath.row]
        let NewKey = dictionary[key]
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NewViewController") as! ViewController
         guard let NewURL = NewKey as? String else {return}
         nextViewController.URLdictionary = NewURL
        navigationController?.pushViewController(nextViewController, animated: true)
       
    }
}





