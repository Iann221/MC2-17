//
//  MealViewController.swift
//  DiaBeta
//
//  Created by Nikita Felicia on 22/06/22.
//

import UIKit

class MealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
//    let myData = ["first", "second", "third", "four", "five","six","seven","eight"]
    let myData = DBHelper.shared.getAllFood()
    let dateFormatter = DateFormatter()
    
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
        
        dateFormatter.dateFormat = "HH:mm"
        let image = UIImage(named: "siomay.jpeg")
//        let someDateTime = dateFormatter.date(from: "2022/06/22 20:21")! as Date
//        let imageData:NSData = image!.jpegData(compressionQuality: 0.5)! as NSData
//        DBHelper.shared.createFood(timestamp: Date(), nama: "ketoprak", category: ["sayur", "racun"], image: imageData, preGula: 100)
//        DBHelper.shared.editFood(postGula: 101, timestamp: someDateTime)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as! MealTableViewCell
        
        let selisih = myData[indexPath.row].postGula - myData[indexPath.row].preGula
        let category = myData[indexPath.row].category?.joined(separator: ", ")
        let rowDate = dateFormatter.string(from: (myData[indexPath.row].timestamp! as Date))
        cell.myLabel.text = "+ \(selisih)"
        if (myData[indexPath.row].postGula == 0){
            cell.myLabel1.layer.opacity = 1
            cell.myLabel.layer.opacity = 0
        } else{
            cell.myLabel1.layer.opacity = 0
            cell.myLabel.layer.opacity = 1
        }
        if (selisih>=30){
            cell.myLabel.backgroundColor = UIColor.red
        } else {
            cell.myLabel.backgroundColor = UIColor.green
        }
        cell.myLabel2.text = myData[indexPath.row].name
        cell.myLabel3.text = category
        cell.myLabel4.text = rowDate
        cell.myImageView.image = UIImage(data: myData[indexPath.row].photo as! Data)
    
        return cell
    }
    
    
}
