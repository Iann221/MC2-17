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
    
        detailImgView.image = UIImage(data: (foodDetail?.foodInfo?.food?.photo)!as Data)
        
        foodNameLbl.text = foodDetail?.foodInfo?.food?.name
        
        let categoryArray = foodDetail?.foodInfo?.food?.category!
        let stringFromArray = categoryArray!.joined(separator: ",")
        categoryLbl.text = stringFromArray
        
        let date = foodDetail?.foodInfo?.food?.timestamp
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        dateTimeLbl.text = dateFormatter.string(from: date!)
        
        preGlucoseLbl.text = "\(Int(foodDetail?.foodInfo?.food?.preGula ?? 0))"
        postGlucoseLbl.text = "\(Int(foodDetail?.foodInfo?.food?.postGula ?? 0))"

    }
}


