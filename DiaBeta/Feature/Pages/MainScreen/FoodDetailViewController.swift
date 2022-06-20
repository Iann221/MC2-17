//
//  FoodDetailViewController.swift
//  DiaBeta
//
//  Created by Yudha Hamdi Arzi on 20/06/22.
//

import UIKit

class FoodDetailViewController: UIViewController {
  @IBOutlet weak var detailImageView: UIImageView!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var dateTimeLabel: UILabel!
  @IBOutlet weak var preGlucoseLabel: UILabel!
  @IBOutlet weak var postGlucoseLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
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
