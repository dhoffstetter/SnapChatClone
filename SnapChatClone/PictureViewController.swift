//
//  PictureViewController.swift
//  SnapChatClone
//
//  Created by Diane Hoffstetter on 9/14/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var descriptionTextField: UITextField!
  @IBOutlet weak var nextButton: UIButton!
  
  var imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    imagePicker.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    imageView.image = image
    imageView.backgroundColor = UIColor.clear
    imagePicker.dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func cameraTapped(_ sender: AnyObject) {
    
    imagePicker.sourceType = .savedPhotosAlbum
    imagePicker.allowsEditing = false
    present(imagePicker, animated: true, completion: nil)
  }
  
  @IBAction func nextTapped(_ sender: AnyObject) {
  }
  
}
