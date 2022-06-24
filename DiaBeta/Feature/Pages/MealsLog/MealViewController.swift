//
//  MealViewController.swift
//  DiaBeta
//
//  Created by Nikita Felicia on 22/06/22.
//

import UIKit

class MealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var dateCollectionView: UICollectionView!
    var selectedRow: Int = -1

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! DateCollectionViewCell
    
        cell2.dateButton.setTitle(dateData[indexPath.row], for: .normal)
        cell2.dateButton.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        //cell2.dateButton.layer.backgroundColor = UIColor.white.cgColor
        
        cell2.dateButton.layer.cornerRadius = 16
        cell2.dateButton.layer.masksToBounds = true
        cell2.dateButton.layer.borderWidth = 1
        cell2.dateButton.layer.borderColor = UIColor(red: 0/255, green: 123/255, blue: 86/255, alpha: 1).cgColor
        
        
        cell2.dateButton.tag = indexPath.row
        cell2.dateButton.addTarget(self, action : #selector(buttonClicked), for: .touchUpInside)
        print(selectedRow)
        print(indexPath.row)
//        if(cell2.dateButton.isSelected) {
//            print(indexPath.row)
//        }
        if(selectedRow == indexPath.row){
            cell2.dateButton.layer.backgroundColor = UIColor(red: 0/255, green: 123/255, blue: 86/255, alpha: 1).cgColor
            cell2.dateButton.setTitleColor(.white, for: .normal)
        }else{
            cell2.dateButton.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
            cell2.dateButton.setTitleColor(UIColor(red: 47/255, green: 72/255, blue: 88/255, alpha: 1), for: .normal)
//            cell2.dateButton.tintColor = UIColor.white
        }
        
        return cell2
    }
    
    @IBAction func buttonClicked(sender: UIButton) {
        let indexpath1 = IndexPath(row: sender.tag, section: 0)
        print(dateData[indexpath1.row])
        selectedRow = indexpath1.row
       // let isAlreadySelected = sender.isSelected == true

//        sender.isSelected = !sender.isSelected
        
//        if(sender.isSelected == true){
//            sender.layer.backgroundColor = UIColor(red: 0/255, green: 123/255, blue: 86/255, alpha: 1).cgColor
//            sender.setTitleColor(.white, for: .normal)
//            
//        }else{
//            sender.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
//            sender.setTitleColor(UIColor(red: 47/255, green: 72/255, blue: 88/255, alpha: 1), for: .normal)
//        }
        dateCollectionView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        dateCollectionView.reloadData()
        
      }
    
    @IBOutlet var tableView: UITableView!
    
//    let myData = ["first", "second", "third", "four", "five","six","seven","eight"]
    
    var dateData:[String]=["Today","01 Jan 2022", "31 Dec 2021","30 Dec 2021","29 Dec 2021","28 Dec 2021","27 Dec 2021"]
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.performSegue(withIdentifier: "TesViewController", sender: self)
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
