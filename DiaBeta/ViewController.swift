//
//  MealViewController.swift
//  DiaBeta
//
//  Created by Nikita Felicia on 22/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    let myData = ["first", "second", "third", "four", "five","six","seven","eight"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title : "Add",
                                                            style : .plain,
                                                            target: self,
                                                            action : nil)
        
        let nib = UINib(nibName: "MealTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MealTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as! MealTableViewCell
        
        cell.myLabel.text = myData[indexPath.row]
        cell.myLabel1.text = myData[indexPath.row]
        cell.myLabel2.text = myData[indexPath.row]
        cell.myLabel3.text = myData[indexPath.row]
        cell.myLabel4.text = myData[indexPath.row]
        cell.myImageView.backgroundColor = .blue
    
        return cell
    }
    
    
}
