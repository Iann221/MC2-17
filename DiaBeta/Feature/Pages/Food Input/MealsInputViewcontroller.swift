import UIKit
import Photos

class MealsInputViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
 
  var imageCoreData: NSData!
  var namaCoreData: String!
  //var kategoriCoreData: [String]!
  var kategoriCoreData = ["Dairy", "Fruit", "Grains", "Protein", "Starch", "Sweets", "Vegetables"]
  var timeStampCoreData: Date!
  var preGulaCoreData: Int64!
  
  @IBOutlet weak var cameraButton: UIButton!
  @IBOutlet weak var cameraPreview: UIImageView!

  
  @IBOutlet weak var DateTime: UIView!
  @IBOutlet weak var FoodName: UIView!
  @IBOutlet weak var Category: UIView!
  @IBOutlet weak var DateView: UIView!
  @IBOutlet weak var TimeView: UIView!
  @IBOutlet weak var preGlucoseView: UIView!
  @IBOutlet weak var mgDL: UILabel!
  
  @IBOutlet weak var preGlucoseTextField: UITextField!
  @IBOutlet weak var foodTextField: UITextField!

  @IBOutlet weak var CategoryButton: UIButton!
  @IBOutlet weak var DatePicker: UIDatePicker!
  @IBOutlet weak var TimePicker: UIDatePicker!
  
  @IBOutlet weak var save: UIButton!
  
  var imagePickerController = UIImagePickerController()
  var picker = UIImagePickerController()
  
  override func viewDidLoad() {
  super.viewDidLoad()
    imagePickerController.delegate = self
    
    // BELUM BISA ROUNDED
//    let image = cameraPreview.image
//    let imageData:NSData = image!.jpegData(compressionQuality: 0.5)! as NSData
//    let myImageView:UIImageView = UIImageView()
//    myImageView.contentMode = UIView.ContentMode.scaleAspectFit
    cameraPreview.layer.cornerRadius = 8
    cameraPreview.clipsToBounds = true
//    myImageView.image = image
    
    //Cek Izin
    checkPermission()
    
    
    
  }
  
//MARK: - Rounding the View
  private func roundUIView(){
    DateTime.layer.cornerRadius = 8
    DateView.layer.cornerRadius = 5
    TimeView.layer.cornerRadius = 5
  }
  
  
//MARK: - To Save
  @IBAction func saveAll(_ sender: Any) {
    
    //Gabungin Date and Time
    let dateFormatr = DateFormatter()
    dateFormatr.dateFormat = "yyyy-MM-dd"
    let strDate = dateFormatr.string(from: (DatePicker?.date)!)
 
    let dateFormatr2 = DateFormatter()
    dateFormatr2.dateFormat = "HH:mm:ssZ"
    let strTime = dateFormatr2.string(from: (TimePicker?.date)!)
    let strDateTime = strDate+"T"+strTime
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    timeStampCoreData = dateFormatter.date(from:strDateTime)!
    
    //Get Food dan input preFula
    foodTextField.text = namaCoreData
    preGulaCoreData = Int64(preGlucoseTextField.text!)
    
    //to Core Data
    DBHelper.shared.createFood(timestamp: timeStampCoreData, nama: namaCoreData, category: kategoriCoreData, image: imageCoreData, preGula: preGulaCoreData)
  }
  
  //MARK: - Gabungin Date and Time
//  func dateChanged(sender : UIDatePicker) {
//    let dateFormatr = DateFormatter()
//    dateFormatr.dateFormat = "yyyy-MM-dd"
//    let strDate = dateFormatr.string(from: (DatePicker?.date)!)
//
//
//
//    let dateFormatr2 = DateFormatter()
//    dateFormatr2.dateFormat = "HH:mm:ssZ"
//    let strTime = dateFormatr2.string(from: (TimePicker?.date)!)
//    let strDateTime = strDate+"T"+strTime
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//    timeStampCoreData = dateFormatter.date(from:strDateTime)!
//
//  }
  
  //MARK: - ToCategory
  
  @IBAction func tappedCategoryButton(_ sender: Any) {
    performSegue(withIdentifier: "mealsToCategory", sender: sender)
  }
  
  
  //MARK: - Image Input
  
  @IBAction func tappedCameraButton(_ sender: Any) {
    let picker = UIImagePickerController()
    picker.sourceType = .camera
    picker.allowsEditing = true
    picker.delegate = self
    present(picker, animated: true)
    
//    let defaultAction = UIAlertAction(title: "Camera",
//                                      style: .default) { [self] (action) in
//   // Respond to user selection of the action.
//              let picker = UIImagePickerController()
//              picker.sourceType = .camera
//              picker.allowsEditing = true
//              picker.delegate = self
//              self.present(picker, animated:true)
//
//      let imageData:NSData = self.cameraPreview.image!.jpegData(compressionQuality: 0.5)! as NSData
//      imageCoreData = imageData
//
//    }
//    let cancelAction = UIAlertAction(title: "Gallery",
//                         style: .cancel) { (action) in
//      self.imagePickerController.sourceType = .photoLibrary
//      self.present(self.imagePickerController, animated: true, completion: nil)
//    }
//
//    // Create and configure the alert controller.
//    let alert = UIAlertController(title: "Method of Input",
//          message: "Please Choose the methode to take the photo",
//          preferredStyle: .alert)
//    alert.addAction(defaultAction)
//    alert.addAction(cancelAction)
//
//    self.present(alert, animated: true) {
//    }
  }
    
    
  func checkPermission(){
    if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized{
      PHPhotoLibrary.requestAuthorization({(status: PHAuthorizationStatus) -> Void in ()
      })
    }
    if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized{
    } else{
      PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
    }
  }
  
  func requestAuthorizationHandler(status: PHAuthorizationStatus){
    if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized{
      print("Access granted to use Photo Library")
    } else{
      print("We don't have access to your Photos.")
    }
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
    if picker.sourceType == .photoLibrary{
      cameraPreview?.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    else{
      cameraPreview?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    }
    
    picker.dismiss(animated: true, completion:nil)
    
  }
  
  
  // FOR DATA INPUT
  
  // Date
//  func createDatePicker(){
//
//    inputDate.textAlignment = .center
//    //toolbar
//    let toolbar = UIToolbar()
//    toolbar.sizeToFit()
//
//    //barbutton
//    let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
//    toolbar.setItems([doneBtn], animated: true)
//
//    //assign toolbar
//    inputDate.inputAccessoryView = toolbar
//
//    //assign date picker to the text field
//    inputDate.inputView = datePicker
//
//    datePicker.datePickerMode = .date
//
//  }
//
//  @objc func donePressed(){
//    let formatter = DateFormatter()
//    formatter.dateStyle = .medium
//    formatter.timeStyle = .none
//
//    inputDate.text = formatter.string(from: datePicker.date)
//    self.view.endEditing(true)
//  }
//
//
//  //Time
//  @objc func timePickerValueChanged(sender: UIDatePicker){
//    let formatter = DateFormatter()
//    formatter.locale = Locale(identifier: "en_gb")
//    formatter.dateFormat = "hh:mm"
//    inputTime.text = formatter.string(from: sender.date)
//  }
  
  
  // Private Function
  

  
  
  
}



