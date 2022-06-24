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
    var foodDetail: FoodInfo?
    @IBOutlet weak var botFoodDetView: UIView!
    @IBOutlet weak var topFoodDetView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView1.layer.cornerRadius = 8
        categoryLabel1.sizeToFit()
        botFoodDetailView1.layer.cornerRadius = 8
      
        let categoryArray = foodDetail?.food?.category!
        let stringFromArray = categoryArray!.joined(separator: ",")
        let date = foodDetail?.food?.timestamp
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        detailImageView1.image = UIImage(data: (foodDetail?.food?.photo)!as Data)
        preGlucoseLabel1.text = "\(Int(foodDetail?.food?.preGula ?? 0))"
        postGlucoseLabel1.text = "\(Int(foodDetail?.food?.postGula ?? 0))"
        categoryLabel1.text = stringFromArray
        dateTimeLabel1.text = dateFormatter.string(from: date!)
        foodNameLabel1.text = foodDetail?.food?.name
    }
}


