//
//  MealsViewController.swift
//  DiaBeta
//
//  Created by Yudha Hamdi Arzi on 20/06/22.
//

import UIKit

class MealsViewController: UIViewController {
  var dateDate = "2022/10/1 "
  var hourHour = 10
  var minuteMinute = 10
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  @IBAction func postMealButton(_ sender: Any) {
    let postValue = Int64.random(in: 111..<160)
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    let sampleData = formatter.date(from: dateDate+String(hourHour)+":"+String(minuteMinute))!
    
    let heh = UIAlertController(
      title: "Glucose Edited",
      message: "This is my first app!",
      preferredStyle: .alert)

    let haction = UIAlertAction(
      title: "Awesome",
      style: .default,
      handler: nil)
    
    DBHelper.shared.editFood(postGula: postValue, timestamp: sampleData)
    minuteMinute += 5
    hourHour += 2
    print("timestamp post:")
    print(sampleData)
    heh.addAction(haction)
    present(heh, animated: true, completion: nil)

  }
  
  @IBAction func insertDataButton(_ sender: Any) {
    let alert = UIAlertController(
      title: "Hello, World",
      message: "This is my first app!",
      preferredStyle: .alert)

    let action = UIAlertAction(
      title: "Awesome",
      style: .default,
      handler: nil)
      let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
      let sampleData = formatter.date(from: dateDate+String(hourHour)+":"+String(minuteMinute))!
      let foodNameArr = ["Pecel Ayam","Steak","Soto Banjar","KFC","MCD"]
    let foodName = foodNameArr[Int.random(in: 0..<foodNameArr.count-1)]
    let foodCategoryArr = [["Grain", "Protein"],["Vegetables","Fruit"],["Dairy","Starch"],["Protein","Vegetables"]]
      let foodCategory = foodCategoryArr[Int.random(in: 0..<foodCategoryArr.count-1)]
      let preValue = Int64.random(in: 90..<110)
      let image = UIImage(named: "siomay.jpeg")
      let imageData:NSData = image!.jpegData(compressionQuality: 0.5)! as NSData
      DBHelper.shared.createFood(timestamp:sampleData, nama: foodName, category: foodCategory, image: imageData, preGula: preValue)
      print("timestamp pre:")
      print(sampleData)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
