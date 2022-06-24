//
//  BloodSugarInputViewController.swift
//  DiaBeta
//
//  Created by Yudha Hamdi Arzi on 23/06/22.
//

import UIKit
import Photos

class BloodSugarInputViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    @IBOutlet weak var imagePicked: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func openCameraButton(sender: AnyObject) {
      if UIImagePickerController.isSourceTypeAvailable(.camera) {
          let imagePicker = UIImagePickerController()
          imagePicker.delegate = self
          imagePicker.sourceType = .camera;
          imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
      }
  }
  
}

