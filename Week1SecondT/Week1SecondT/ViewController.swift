//
//  ViewController.swift
//  Week1SecondT
//
//  Created by Sharan on 9/16/19.
//  Copyright © 2019 Sharan. All rights reserved.
//

import UIKit

var result: String = String("You selected \(waterpark ) sorry to say you" )
var waterpark = ["wake up", "freshen up ", " Breakfast Time" , "Project Done? " , "Head back to Bootcamp"]
var row = 0
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waterpark.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        Cell?.textLabel?.text = waterpark[indexPath.row]
        return Cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextviewcontroller = storyboard.instantiateViewController(withIdentifier: "TableViewCopy")
        navigationController?.pushViewController( nextviewcontroller, animated: true)
        
    }
    
    
    
}

