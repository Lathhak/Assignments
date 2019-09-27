//
//  ViewController.swift
//  Exam3Project
//
//  Created by Sharan on 9/27/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SegmentOutlook: UISegmentedControl!
    @IBOutlet weak var FirstTableView: UITableView!
    var dictionary: Jokes
    
   
    @IBAction func SegmentClick(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print(" Nothing")
        case 1:
            print("Mess")
        case 2:
            print("dirty")
        case 3:
            print("nto so ")
        case 4:
            print("not so funny")
        default:
                print("my love")
        
    }
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        FirstTableView.dataSource = self
        guard let url = URL(string: "https://sv443.net/jokeapi/category/Any") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data , let container = try? JSONDecoder().decode(Jokes.self, from: data) else {return}
            self.dictionary = container 
            print(self.dictionary)
            DispatchQueue.main.async {
                self.FirstTableView.reloadData()
            }
            }.resume()

       
        
        
        
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        cell.textLabel?.text = ""
        return cell
        
    }
    
    
}
