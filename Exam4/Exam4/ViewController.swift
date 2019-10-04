//
//  ViewController.swift
//  Exam4
//
//  Created by Sharan on 10/4/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var image: [String: Any] = [:]
    
    @IBOutlet weak var DisplayTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayTableView.dataSource = self
        DisplayTableView.delegate = self
     
        guard let url = URL(string: "https://pixabay.com/api/?key=13840198-42a7f75768209337d23e3ec0b&q=dad&image_type=photo&pretty=true") else  {return}
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, let imageValue = try? JSONSerialization.jsonObject(with: data, options: []) as?  [String: Any] else {
                return
            }
            self.image = imageValue
            print(imageValue)
            DispatchQueue.main.async {
                self.DisplayTableView.reloadData()
            }
        }.resume()
        
   
    }


}

struct hits: Codable {
    let largeImageURL: String
    let likes: Int?
    let comments: Int?
    let views: Int?
    let userImageURL: String
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        return cell
    }
    
    
    
}


extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController =  (storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? ViewController)!
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
}
