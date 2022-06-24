//
//  FoodDetailViewController.swift
//  DiaBeta
//
//  Created by Yudha Hamdi Arzi on 20/06/22.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImgView: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var dateTimeLbl: UILabel!
    @IBOutlet weak var preGlucoseLbl: UILabel!
    @IBOutlet weak var postGlucoseLbl: UILabel!
    @IBOutlet weak var foodNameLbl: UILabel!
    var foodDetail: Food?
    @IBOutlet weak var botFoodDetView: UIView!
    @IBOutlet weak var topFoodDetView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailImgView.layer.cornerRadius = 8
        categoryLbl.sizeToFit()
        botFoodDetView.layer.cornerRadius = 8
      
//        let categoryArray = foodDetail?.food?.category!
//        let stringFromArray = categoryArray!.joined(separator: ",")
//        let date = foodDetail?.food?.timestamp
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
//        detailImageView.image = UIImage(data: (foodDetail?.food?.photo)!as Data)
//        preGlucoseLabel.text = "\(Int(foodDetail?.food?.preGula ?? 0))"
//        postGlucoseLabel.text = "\(Int(foodDetail?.food?.postGula ?? 0))"
//        categoryLabel.text = stringFromArray
//        dateTimeLabel.text = dateFormatter.string(from: date!)
//        foodNameLabel.text = foodDetail?.food?.name
        
        let categoryArray = foodDetail?.category!.joined(separator: ", ")
        categoryLbl.text = categoryArray
        
//        detailImgView.image = UIImage(data: ((foodDetail?.food?.photo) as! Data)
//
//        let selisih = foodInfos[indexPath.row].postGula - foodInfos[indexPath.row].preGula
//        let category = foodInfos[indexPath.row].category?.joined(separator: ", ")
//        let rowDate = dateFormatter.string(from: (foodInfos[indexPath.row].timestamp! as Date))
//        cell.myLabel.text = "+ \(selisih)"
//        if (foodInfos[indexPath.row].postGula == 0){
//            cell.myLabel1.layer.opacity = 1
//            cell.myLabel.layer.opacity = 0
//        } else{
//            cell.myLabel1.layer.opacity = 0
//            cell.myLabel.layer.opacity = 1
//        }
//        if (selisih>=30){
//            cell.myLabel.backgroundColor = UIColor.red
//        } else {
//            cell.myLabel.backgroundColor = UIColor.green
//        }
//        cell.myLabel2.text = foodInfos[indexPath.row].name
//        cell.myLabel3.text = category
//        cell.myLabel4.text = rowDate
        
        
    }
}


