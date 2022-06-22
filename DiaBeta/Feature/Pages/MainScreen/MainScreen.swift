//
//  MainScreen.swift
//  DiaBeta
//
//  Created by Yudha Hamdi Arzi on 20/06/22.
//

import UIKit

var goodFoodInfo:[FoodInfo] = [] //collect good food data
var badFoodInfo:[FoodInfo] = [] //collect bad food data

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
  
  var selectedFoodInfo: FoodInfo?

  

  override func viewDidLoad() {
        super.viewDidLoad()
        self.topView.backgroundColor = UIColor(named: "AccentColor")
        bottomView.layer.cornerRadius = 10
        
        newsView.layer.cornerRadius = 8
        newsView.layer.shadowOffset = CGSize(width: 5, height: 5)
        newsView.layer.shadowRadius = 5
        newsView.layer.shadowOpacity = 0.3
        let nibCell = UINib(nibName: "GlucoseFoodCell", bundle: nil)
        foodCollectionView.register(nibCell, forCellWithReuseIdentifier: "foodCell")
        badFoodCollectionView.register(nibCell, forCellWithReuseIdentifier: "foodCell")
        goodFoodInfo = DBHelper.shared.getGood()
        badFoodInfo = DBHelper.shared.getBad()
    }
  
  @IBAction func seeAllGoodFood(_ sender: UIButton) {
    print("All Good Food")
    
  }
  @IBAction func seeAllBadFood(_ sender: UIButton) {
    print("All Bad Food")
  }
  
}


extension MainScreen: UICollectionViewDelegate, UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == foodCollectionView {
      return goodFoodInfo.count
    }
    else {
      return badFoodInfo.count
    }
  }


  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == foodCollectionView {
      selectedFoodInfo = goodFoodInfo[indexPath.row]
    }
    else {
      selectedFoodInfo = badFoodInfo[indexPath.row]
    }
    performSegue(withIdentifier: "foodDetail", sender: self)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! GlucoseFoodCell
    
    if collectionView == foodCollectionView {
      cell.foodImage.image = UIImage(data: (goodFoodInfo[indexPath.row].food?.photo)!as Data)
      cell.foodName.text = goodFoodInfo[indexPath.row].food?.name
      cell.foodLabel.text = goodFoodInfo[indexPath.row].food?.category![0]
      cell.glucoseLabel.text = "+ " + String(goodFoodInfo[indexPath.row].selisih) + " mg/dL"
      cell.glucoseLabel.backgroundColor = UIColor.green
      return cell
    }
    else {
      cell.foodImage.image = UIImage(data: (badFoodInfo[indexPath.row].food?.photo)!as Data)
      cell.foodName.text = badFoodInfo[indexPath.row].food?.name
      cell.foodLabel.text = badFoodInfo[indexPath.row].food?.category![0]
      cell.glucoseLabel.text = "+ " + String(badFoodInfo[indexPath.row].selisih) + " mg/dL"
      cell.glucoseLabel.backgroundColor = UIColor.red
      return cell
    }

  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let foodDetailVC = segue.destination as! FoodDetailViewController
    foodDetailVC.foodDetail = selectedFoodInfo //sesuain sama cell
    
  }
}


