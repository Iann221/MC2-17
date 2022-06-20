//
//  MainScreen.swift
//  DiaBeta
//
//  Created by Yudha Hamdi Arzi on 20/06/22.
//

import UIKit

var goodFoodNameArr:[String] = ["Nasi Padang", "Nasi Uduk", "Pecel Ayam", "Bubur Kacang Ijo", "Steak"]
var goodFoodLabelArr:[String] = ["Protein, Vegetables", "Protein, Grain, Starch", "Starch, Fruit", "Protein, Vegetables", "Protein"]
var goodGlucoselvlArr:[Int64] = [30, 11, 18, 10, 5]
var foodImgArr:[String] = ["nasi padang", "nasi uduk", "pecel ayam", "bubur kacang", "steak"]

class MainScreen: UIViewController {

  @IBOutlet weak var bottomView: UIView!
  @IBOutlet weak var topView: UIView!
  @IBOutlet weak var newsView: UIView!
  @IBOutlet weak var newsTopLabel: UILabel!
  @IBOutlet weak var newsBottomLabel: UILabel!
  @IBOutlet weak var foodCollectionView: UICollectionView!
  @IBOutlet weak var badFoodCollectionView: UICollectionView!
  @IBOutlet weak var allGoodFood: UIButton!
  @IBOutlet weak var allBadFood: UIButton!
  

  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.topView.backgroundColor = UIColor(named: "AccentColor")
        bottomView.layer.cornerRadius = 10
        
        newsView.layer.cornerRadius = 8
        newsView.layer.shadowOffset = CGSize(width: 5,
                                          height: 5)
        newsView.layer.shadowRadius = 5
        newsView.layer.shadowOpacity = 0.3
        // Do any additional setup after loading the view.
        let nibCell = UINib(nibName: "GlucoseFoodCell", bundle: nil)
        foodCollectionView.register(nibCell, forCellWithReuseIdentifier: "foodCell")
        badFoodCollectionView.register(nibCell, forCellWithReuseIdentifier: "foodCell")
    }
  
  @IBAction func seeAllGoodFood(_ sender: UIButton) {
    print("All Good Food")
  }
  @IBAction func seeAllBadFood(_ sender: UIButton) {
    print("All Bad Food")
  }
  
  
  
  
  
  
  
}

extension MainScreen{
  
  
  
  
  
}




extension MainScreen: UICollectionViewDelegate, UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == foodCollectionView {
      return goodFoodNameArr.count
    }
    else {
      return goodFoodNameArr.count
    }
    
   
  }


  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    print("selected" + String(indexPath.row) + goodFoodNameArr[indexPath.row])
    performSegue(withIdentifier: "foodDetail", sender: self)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! GlucoseFoodCell
    if collectionView == foodCollectionView {
      cell.foodImage.image = UIImage(named: foodImgArr[indexPath.row])
      cell.foodName.text = goodFoodNameArr[indexPath.row]
      cell.foodLabel.text = goodFoodLabelArr[indexPath.row]
      cell.glucoseLabel.text = "+ " + String(goodGlucoselvlArr[indexPath.row]) + " mg/dL"
      
      if goodGlucoselvlArr[indexPath.row] > 30 {
        cell.glucoseLabel.backgroundColor = UIColor.red
      }
      else {
        cell.glucoseLabel.backgroundColor = UIColor.green
      }
      return cell
    }
    else {
      cell.foodImage.image = UIImage(named: foodImgArr[indexPath.row])
      cell.foodName.text = goodFoodNameArr[indexPath.row]
      cell.foodLabel.text = goodFoodLabelArr[indexPath.row]
      cell.glucoseLabel.text = "+ " + String(goodGlucoselvlArr[indexPath.row]) + " mg/dL"
      cell.glucoseLabel.backgroundColor = UIColor.red
      return cell
    }

  }
}

