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
        detailImgView.layer.cornerRadius = 8
        categoryLbl.sizeToFit()
        botFoodDetView.layer.cornerRadius = 8
      
        let categoryArray = foodDetail?.food?.category!
        let stringFromArray = categoryArray!.joined(separator: ",")
        let date = foodDetail?.food?.timestamp
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        detailImgView.image = UIImage(data: (foodDetail?.food?.photo)!as Data)
        preGlucoseLbl.text = "\(Int(foodDetail?.food?.preGula ?? 0))"
        postGlucoseLbl.text = "\(Int(foodDetail?.food?.postGula ?? 0))"
        categoryLbl.text = stringFromArray
        dateTimeLbl.text = dateFormatter.string(from: date!)
        foodNameLbl.text = foodDetail?.food?.name
    }
}


